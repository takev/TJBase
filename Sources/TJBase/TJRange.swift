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

struct TJRange<T: Comparable>: CustomStringConvertible {
    let lowerBound: TJBoundType<T>
    let upperBound: TJBoundType<T>

 var description : String {
        switch (lowerBound, upperBound) {
            case let (.Min, .OpenLow(v2)):                      return "∞ ..< \(v2)"
            case let (.Min, .Closed(v2)):                       return "∞ ... \(v2)"
            case     (.Min, .Max):                              return "∞ ... ∞"
            case let (.Closed(v1), .OpenLow(v2)):               return "\(v1) ..< \(v2)"
            case let (.Closed(v1), .Closed(v2)) where v1 == v2: return "\(v1)"
            case let (.Closed(v1), .Closed(v2)):                return "\(v1) ... \(v2)"
            case let (.Closed(v1), .Max):                       return "\(v1) ... ∞"
            case let (.OpenHigh(v1), .OpenLow(v2)):             return "\(v1) >.< \(v2)"
            case let (.OpenHigh(v1), .Closed(v2)):              return "\(v1) >.. \(v2)"
            case let (.OpenHigh(v1), .Max):                     return "\(v1) >.. ∞"
            default: preconditionFailure("lowerBound, upperBound types combination is not allowed.")
        }
    }

    init(_ lowerBound: TJBoundType<T>, _ upperBound: TJBoundType<T>) {
        switch lowerBound {
            case .Min, .Closed, .OpenHigh: break
            default: assertionFailure("lowerBound must be .Min, .Closed or .OpenHigh")
        }

        switch upperBound {
            case .Max, .Closed, .OpenLow: break
            default: assertionFailure("upperBound must be .Max, .Closed or .OpenLow")
        }
        assert(lowerBound <= upperBound, "upperBound must be greater or equal to lowerBound")

        self.lowerBound = lowerBound
        self.upperBound = upperBound
    }

    init() {
        self.init(.Min, .Max)
    }

    init(_ value: T) {
        self.init(.Closed(value), .Closed(value))
    }

    init(_ range: ClosedRange<T>) {
        self.init(.Closed(range.lowerBound), .Closed(range.upperBound))
    }

    init(leftOpen range: ClosedRange<T>) {
        self.init(.OpenHigh(range.lowerBound), .Closed(range.upperBound))
    }

    init(_ range: Range<T>) {
        self.init(.Closed(range.lowerBound), .OpenLow(range.upperBound))
    }

    init(leftOpen range: Range<T>) {
        self.init(.OpenHigh(range.lowerBound), .OpenLow(range.upperBound))
    }

    init(_ range: PartialRangeFrom<T>) {
        self.init(.Closed(range.lowerBound), .Max)
    }

    init(leftOpen range: PartialRangeFrom<T>) {
        self.init(.OpenHigh(range.lowerBound), .Max)
    }

    init(_ range: PartialRangeUpTo<T>) {
        self.init(.Min, .OpenLow(range.upperBound))
    }

    init(_ range: PartialRangeThrough<T>) {
        self.init(.Min, .Closed(range.upperBound))
    }

    static func ==(lhs: T, rhs: TJRange) -> Bool {
        return lhs >= rhs.lowerBound && lhs <= rhs.upperBound
    }

    static func ==(lhs: TJBoundType<T>, rhs: TJRange) -> Bool {
        return lhs >= rhs.lowerBound && lhs <= rhs.upperBound
    }

    static func !=(lhs: T, rhs: TJRange) -> Bool {
        return lhs < rhs.lowerBound || lhs > rhs.upperBound
    }

    static func <(lhs: T, rhs: TJRange) -> Bool {
        return lhs < rhs.lowerBound
    }

    static func >(lhs: T, rhs: TJRange) -> Bool {
        return lhs > rhs.upperBound
    }

    static func <<(lhs: TJRange, rhs: TJRange) -> Bool {
        return lhs.upperBound < rhs.lowerBound
    }

    static func >>(lhs: TJRange, rhs: TJRange) -> Bool {
        return lhs.lowerBound > rhs.upperBound
    }

    static func ===(lhs: TJRange, rhs: TJRange) -> Bool {
        return lhs.lowerBound == rhs.lowerBound && lhs.upperBound == rhs.upperBound
    }

    static func !==(lhs: TJRange, rhs: TJRange) -> Bool {
        return lhs.lowerBound != rhs.lowerBound || lhs.upperBound != rhs.upperBound
    }

    static func ==(lhs: TJRange, rhs: TJRange) -> Bool {
        return lhs.lowerBound >= rhs.lowerBound && lhs.upperBound <= rhs.upperBound
    }

    static func !=(lhs: TJRange, rhs: TJRange) -> Bool {
        return lhs.upperBound < rhs.lowerBound || lhs.lowerBound > rhs.upperBound
    }

    static func <>(lhs: TJRange, rhs: TJRange) -> Bool {
        return lhs.lowerBound < rhs.lowerBound && lhs.upperBound > rhs.upperBound
    }

    static func ≤≥(lhs: TJRange, rhs: TJRange) -> Bool {
        return lhs.lowerBound <= rhs.lowerBound && lhs.upperBound >= rhs.upperBound
    }

    static func <=(lhs: TJRange, rhs: TJRange) -> Bool {
        return lhs.lowerBound < rhs.lowerBound && lhs.upperBound == rhs
    }

    static func ≤=(lhs: TJRange, rhs: TJRange) -> Bool {
        return lhs.lowerBound <= rhs.lowerBound && lhs.upperBound == rhs
    }

    static func =>(lhs: TJRange, rhs: TJRange) -> Bool {
        return lhs.lowerBound == rhs && lhs.upperBound > rhs.upperBound
    }

    static func =≥(lhs: TJRange, rhs: TJRange) -> Bool {
        return lhs.lowerBound == rhs && lhs.upperBound >= rhs.upperBound
    }

    static func -(lhs: TJRange, rhs: TJRange) -> [TJRange] {
        if rhs ≤≥ lhs {
            // Fully overlapping means the rhs dissapears.
            return []

        } else if rhs != lhs {
            // Not overlapping.
            return [lhs]

        } else if rhs =≥ lhs {
            // rhs overlaps the lhs.upperBound
            switch rhs.lowerBound {
                case     .Min:          return [TJRange(lhs.lowerBound, .Min)]
                case let .OpenLow(v):   return [TJRange(lhs.lowerBound, .OpenLow(v))]
                case let .Closed(v):    return [TJRange(lhs.lowerBound, .OpenLow(v))]
                case let .OpenHigh(v):  return [TJRange(lhs.lowerBound, .Closed(v))]
                case     .Max:          return [TJRange(lhs.lowerBound, .Max)]
            }

        } else if rhs ≤= lhs {
            // rhs overlaps the lhs.lowerBound
            switch rhs.upperBound {
                case     .Min:          return [TJRange(.Min,           lhs.upperBound)]
                case let .OpenLow(v):   return [TJRange(.Closed(v),     lhs.upperBound)]
                case let .Closed(v):    return [TJRange(.OpenHigh(v),   lhs.upperBound)]
                case let .OpenHigh(v):  return [TJRange(.OpenHigh(v),   lhs.upperBound)]
                case     .Max:          return [TJRange(.Max,           lhs.upperBound)]
            }

        } else {
            // rhs is completely inside lhs without touching the edges.
            var ranges : [TJRange<T>] = []

            switch rhs.lowerBound {
                case     .Min:          ranges.append(TJRange(lhs.lowerBound, .Min))
                case let .OpenLow(v):   ranges.append(TJRange(lhs.lowerBound, .OpenLow(v)))
                case let .Closed(v):    ranges.append(TJRange(lhs.lowerBound, .OpenLow(v)))
                case let .OpenHigh(v):  ranges.append(TJRange(lhs.lowerBound, .Closed(v)))
                case     .Max:          ranges.append(TJRange(lhs.lowerBound, .Max))
            }

            switch rhs.upperBound {
                case     .Min:          ranges.append(TJRange(.Min,           lhs.upperBound))
                case let .OpenLow(v):   ranges.append(TJRange(.Closed(v),     lhs.upperBound))
                case let .Closed(v):    ranges.append(TJRange(.OpenHigh(v),   lhs.upperBound))
                case let .OpenHigh(v):  ranges.append(TJRange(.OpenHigh(v),   lhs.upperBound))
                case     .Max:          ranges.append(TJRange(.Max,           lhs.upperBound))
            }

            return ranges
        }
    }

    static func -(lhs: TJRange, rhs: ClosedRange<T>) -> [TJRange] {
        return lhs - TJRange(rhs)
    }
}

func compare<T>(_ lhs: TJRange<T>, _ rhs: TJRange<T>) -> Int {
    let tmp = compare(lhs.lowerBound, rhs.lowerBound)

    if tmp == 0 {
        return compare(lhs.upperBound, rhs.upperBound)

    } else {
        return tmp
    }
}


