// TJRegex - A Swift package for working with large integers.
// Copyright (C) 2017  Tjienta Vara
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

enum Bound<T: Comparable>: Equatable {
    case Open(T)
    case Closed(T)
    case Infinite

    static func == (lhs: Bound, rhs: Bound) -> Bool {
        switch (lhs, rhs) {
            case let (.Open(l),     .Open(r))   where l == r: return true
            case let (.Closed(l),   .Closed(r)) where l == r: return true
            case     (.Infinite,    .Infinite): return true
            default: return false
        }
    }

    static func <= (_ lhs: Bound, _ rhs: Bound) -> Bool {
        switch (lhs, rhs) {
            case     (.Infinite,    _):          return true
            case     (_,            .Infinite):  return true
            case let (.Closed(l),   .Closed(r)): return l <= r
            case let (.Closed(l),   .Open(r)):   return l < r
            case let (.Open(l),     .Closed(r)): return l < r
            case let (.Open(l),     .Open(r)):   return l < r
        }
    }
}

enum CompareResult {
    case Lower
    case Same
    case Higher
}

enum RangeCompareResult {
    case Lower              // The primary range is not overlapping and lower than the secondary range.
    case OverlapLower       // The primary range is overlapping and lower than the secondary range.
    case FullOverlapLower   // The primary range is fully overlapping with the secondary range and extending on the lower side.
    case InsideLowerEdge    // The primary range is inside the secondary range and touching the lower edge.
    case FullOverlap        // The primary range is fully overlapping with the secondary range and extending on both sides.
    case Same               // The primary range is inside the secondary range and touching both edges.
    case Inside             // The primary range is inside the secondary range but not touching either edge.
    case InsideHigherEdge   // The primary range is inside the secondary range and touching the higher edge.
    case FullOverlapHigher  // The primary range is fully overlapping with the secondary range and extending on the higher side.
    case OverlapHigher      // The primary range is overlapping and higher than the secondary range.
    case Higher             // The primary range is not overlapping and lower than the secondary range.
}


public struct TJRange<T: Comparable>: CustomStringConvertible, Equatable, Comparable {
    let lowerBound: Bound<T>
    let upperBound: Bound<T>

    public var description : String {
        switch (lowerBound, upperBound) {
            case let (.Infinite,        .Open(v2)):                     return "∞ ..< \(v2)"
            case let (.Infinite,        .Closed(v2)):                   return "∞ ... \(v2)"
            case     (.Infinite,        .Infinite):                     return "∞ ... ∞"
            case let (.Closed(v1),      .Open(v2)):                     return "\(v1) ..< \(v2)"
            case let (.Closed(v1),      .Closed(v2))    where v1 == v2: return "\(v1)"
            case let (.Closed(v1),      .Closed(v2)):                   return "\(v1) ... \(v2)"
            case let (.Closed(v1),      .Infinite):                     return "\(v1) ... ∞"
            case let (.Open(v1),        .Open(v2)):                     return "\(v1) >.< \(v2)"
            case let (.Open(v1),        .Closed(v2)):                   return "\(v1) >.. \(v2)"
            case let (.Open(v1),        .Infinite):                     return "\(v1) >.. ∞"
        }
    }

    init(_ lowerBound: Bound<T>, _ upperBound: Bound<T>) {
        assert(lowerBound <= upperBound, "upperBound must be greater or equal to lowerBound")

        self.lowerBound = lowerBound
        self.upperBound = upperBound
    }

    public init() {
        self.init(.Infinite, .Infinite)
    }

    public init(_ value: T) {
        self.init(.Closed(value), .Closed(value))
    }

    public init(_ range: ClosedRange<T>) {
        self.init(.Closed(range.lowerBound), .Closed(range.upperBound))
    }

    public init(leftOpen range: ClosedRange<T>) {
        self.init(.Open(range.lowerBound), .Closed(range.upperBound))
    }

    public init(_ range: Range<T>) {
        self.init(.Closed(range.lowerBound), .Open(range.upperBound))
    }

    public init(leftOpen range: Range<T>) {
        self.init(.Open(range.lowerBound), .Open(range.upperBound))
    }

    public init(_ range: PartialRangeFrom<T>) {
        self.init(.Closed(range.lowerBound), .Infinite)
    }

    public init(leftOpen range: PartialRangeFrom<T>) {
        self.init(.Open(range.lowerBound), .Infinite)
    }

    public init(_ range: PartialRangeUpTo<T>) {
        self.init(.Infinite, .Open(range.upperBound))
    }

    public init(_ range: PartialRangeThrough<T>) {
        self.init(.Infinite, .Closed(range.upperBound))
    }

    public static func ==(lhs: TJRange, rhs: TJRange) -> Bool {
        return lhs.lowerBound == rhs.lowerBound && lhs.upperBound == rhs.upperBound
    }

    public static func <(lhs: TJRange, rhs: TJRange) -> Bool {
        switch (lhs.lowerBound, rhs.lowerBound) {
            case     (.Infinite,    .Infinite):                 break
            case     (.Infinite,    _):                         return true
            case     (_,            .Infinite):                 return false
            case let (.Closed(l),   .Closed(r)) where l != r:   return l < r
            case let (.Open(l),     .Open(r))   where l != r:   return l < r
            case let (.Closed(l),   .Open(r)):                  return l <= r
            case let (.Open(l),     .Closed(r)):                return l < r
            default: break
        }

        switch (lhs.upperBound, rhs.upperBound) {
            case     (.Infinite,     _):            return false
            case     (_,             .Infinite):    return true
            case let (.Closed(l),   .Closed(r)):    return l < r
            case let (.Open(l),     .Open(r)):      return l < r
            case let (.Closed(l),   .Open(r)):      return l < r
            case let (.Open(l),     .Closed(r)):    return l <= r
            default: return false
        }
    }

    func compareLowerInfinite() -> CompareResult {
        switch (lowerBound) {
            case .Infinite: return .Same
            default: return .Lower
        }
    }

    func compareLowerOpen(_ other: T) -> CompareResult {
        switch lowerBound {
            case let .Closed(v) where other <  v: return .Lower
            case let .Open(v)   where other <  v: return .Lower
            default: break
        }

        switch upperBound {
            case let .Closed(v) where other >= v: return .Higher
            case let .Open(v)   where other >= v: return .Higher
            default: return .Same
        }
    }

    func compareUpperInfinite() -> CompareResult {
        switch (upperBound) {
            case .Infinite: return .Same
            default: return .Higher
        }
    }

    func compareUpperOpen(_ other: T) -> CompareResult {
        switch lowerBound {
            case let .Closed(v) where other <= v: return .Lower
            case let .Open(v)   where other <= v: return .Lower
            default: break
        }

        switch upperBound {
            case let .Closed(v) where other >  v: return .Higher
            case let .Open(v)   where other >  v: return .Higher
            default: return .Same
        }
    }

    func compare(_ other: T) -> CompareResult {
        switch lowerBound {
            case let .Closed(v) where other <  v: return .Lower
            case let .Open(v)   where other <= v: return .Lower
            default: break
        }

        switch upperBound {
            case let .Closed(v) where other >  v: return .Higher
            case let .Open(v)   where other >= v: return .Higher
            default: return  .Same
        }
    }

    func compareLowerBound(_ other: Bound<T>) -> CompareResult {
        switch other {
            case     .Infinite:     return compareLowerInfinite()
            case let .Closed(v):    return compare(v)
            case let .Open(v):      return compareLowerOpen(v)
        }
    }

    func compareUpperBound(_ other: Bound<T>) -> CompareResult {
        switch other {
            case     .Infinite:     return compareUpperInfinite()
            case let .Closed(v):    return compare(v)
            case let .Open(v):      return compareUpperOpen(v)
        }
    }

    func compare(_ other: TJRange) -> RangeCompareResult {
        switch (compareLowerBound(other.lowerBound), compareUpperBound(other.upperBound)) {
            case (.Lower,  .Lower):     return .Lower
            case (.Lower,  .Same):      return other.upperBound == upperBound ? .FullOverlapLower : .OverlapLower
            case (.Lower,  .Higher):    return .FullOverlap
            case (.Same,   .Lower):     preconditionFailure("Impossible range comparison")
            case (.Same,   .Same):
                if other.lowerBound == lowerBound && other.upperBound == upperBound {
                    return .Same
                } else if other.lowerBound == lowerBound {
                    return .InsideLowerEdge
                } else if other.upperBound == upperBound {
                    return .InsideHigherEdge
                } else {
                    return .Inside
                }
            case (.Same,   .Higher):    return other.lowerBound == lowerBound ? .FullOverlapHigher : .OverlapHigher
            case (.Higher, .Lower):     preconditionFailure("Impossible range comparison")
            case (.Higher, .Same):      preconditionFailure("Impossible range comparison")
            case (.Higher, .Higher):    return .Higher
        }
    }

    public static func ~=(lhs: TJRange,  rhs: T) -> Bool {
        return lhs.compare(rhs) == .Same
    }

    public static func ~=(lhs: TJRange, rhs: TJRange) -> Bool {
        switch lhs.compare(rhs) {
            case .Inside, .InsideLowerEdge, .InsideHigherEdge, .Same: return true
            default: return false
        }
    }

    public static func -(lhs: TJRange, rhs: TJRange) -> [TJRange] {
        switch lhs.compare(rhs) {
        case .Same, .FullOverlap, .FullOverlapLower, .FullOverlapHigher:
            // Fully overlapping means the lhs dissapears.
            return []

        case .Lower, .Higher:
            // Not overlapping, so lhs remains intact
            return [lhs]

        case .OverlapHigher, .InsideHigherEdge:
            // rhs overlaps the lhs on the upperBound, chopping of the upperBound
            switch rhs.lowerBound {
                case     .Infinite:     return [] // Both lowerBounds are -infinite
                case let .Open(v):      return [TJRange(lhs.lowerBound, .Closed(v))]
                case let .Closed(v):    return [TJRange(lhs.lowerBound, .Open(v))]
            }

        case .OverlapLower, .InsideLowerEdge:
            // rhs overlaps the lhs on the lowerBound, chopping of the lowerBound
            switch rhs.upperBound {
                case     .Infinite:     return [] // Both upperBounds are +infinite
                case let .Open(v):      return [TJRange(.Closed(v), lhs.upperBound)]
                case let .Closed(v):    return [TJRange(.Open(v), lhs.upperBound)]
            }

        case .Inside:
            // rhs is inside the without touching the edges of lhs, meaning it will slice the lhs in two.
            switch (rhs.lowerBound, rhs.upperBound) {
                case     (.Infinite,    _):             preconditionFailure("Infinte inside bound is not possible.")
                case     (_,            .Infinite):     preconditionFailure("Infinte inside bound is not possible.")
                case let (.Open(l),     .Open(u)):      return [TJRange(lhs.lowerBound, .Closed(l)), TJRange(.Closed(u), lhs.upperBound)]
                case let (.Open(l),     .Closed(u)):    return [TJRange(lhs.lowerBound, .Closed(l)), TJRange(.Open(u),   lhs.upperBound)]
                case let (.Closed(l),   .Open(u)):      return [TJRange(lhs.lowerBound, .Open(l)),   TJRange(.Closed(u), lhs.upperBound)]
                case let (.Closed(l),   .Closed(u)):    return [TJRange(lhs.lowerBound, .Open(l)),   TJRange(.Open(u),   lhs.upperBound)]
            }
        }
    }

    public static func -(lhs: TJRange, rhs: ClosedRange<T>) -> [TJRange] {
        return lhs - TJRange(rhs)
    }
}

func merge<T>(_ ranges: [TJRange<T>]) -> [TJRange<T>] {
    var tmp: [TJRange<T>] = []
    tmp.reserveCapacity(ranges.count * 3)

    for newRange in ranges {
        // Remove the overapping parts of the ranges already in the list.
        var i = 0
        while i < tmp.count {
            let replacementRanges = tmp[i] - newRange
            tmp.replaceSubrange(i ... i, with: replacementRanges)
            i += replacementRanges.count
        }

        tmp.append(newRange)
    }

    return tmp
}

prefix func ~ <T>(ranges: [TJRange<T>]) -> [TJRange<T>] {
    // Start with an infinite range from which to subtract ranges.
    var tmp: [TJRange<T>] = [TJRange()]
    tmp.reserveCapacity(ranges.count * 2)

    for newRange in ranges {
        // Remove the overapping parts of the ranges already in the list.
        var i = 0
        while i < tmp.count {
            let replacementRanges = tmp[i] - newRange
            tmp.replaceSubrange(i ... i, with: replacementRanges)
            i += replacementRanges.count
        }
    }

    return tmp
}



