//
//  ClosedRange_extensions.swift
//  TJBase
//
//  Created by Tjienta Vara on 2017-09-11.
//

import Foundation

extension ClosedRange {
    func extend(with: ClosedRange) -> ClosedRange {
        return ClosedRange(uncheckedBounds: (
            lower: min(self.lowerBound, with.lowerBound),
            upper: max(self.upperBound, with.upperBound)
        ))
    }
}

/// From an array of closed ranges. Find all overlapping ranges and merge them.
public func mergeOverlappingRanges<T>(_ ranges: [ClosedRange<T>]) -> [ClosedRange<T>] {
    // Create two arrays which are being swapped between. We only need to allocate them here once.
    var rangesToReturn: [ClosedRange<T>] = []
    var oldRanges: [ClosedRange<T>] = []

    rangesToReturn.reserveCapacity(ranges.count)
    oldRanges.reserveCapacity(ranges.count)

    // Each range is extended by every overlapping range that is already in rangesToReturn.
    for var newRange in ranges {
        (oldRanges, rangesToReturn) = (rangesToReturn, oldRanges)

        // All non-overlapping ranges from oldRanges is moved into rangesToReturn and all overlapping ranges are used to extend the newRange.
        // At the end of the while loop oldRanges is empty, to be reused as the next iteration's rangesToReturn.
        // Both arrays are used as stacks which are O(1) operations.
        while let oldRange = oldRanges.popLast() {
            if newRange.overlaps(oldRange) {
                newRange = newRange.extend(with: oldRange)

            } else {
                rangesToReturn.append(oldRange)
            }
        }

        rangesToReturn.append(newRange)
    }

    return rangesToReturn
}

public func universalRanges<T>(_ ranges: [ClosedRange<T>]) -> [UniversalRange<T>] {
    return ranges.map{UniversalRange($0)}
}

public func invertedUniversalRanges<T>(_ ranges: [ClosedRange<T>]) -> [UniversalRange<T>] {
    var rangesToReturn: [UniversalRange<T>] = []
    var previousUpperBound: RangeEndPoint<T> = .Infinite

    for oldRange in ranges {
        rangesToReturn.append(UniversalRange(previousUpperBound, .Open(oldRange.lowerBound)))
        previousUpperBound = .Open(oldRange.upperBound)
    }
    rangesToReturn.append(UniversalRange(previousUpperBound, .Infinite))

    return rangesToReturn
}

