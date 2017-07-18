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

enum TJBoundType<T: Comparable> {
    case Min
    case OpenLow(T)
    case Closed(T)
    case OpenHigh(T)
    case Max

    static func compare(_ lhs: TJBoundType, _ rhs: TJBoundType) -> Int {
        switch (lhs, rhs) {
            case     (.Min,          .Min):                         return  0
            case     (.Min,          _):                            return -1
            case     (_,             .Min):                         return  1
            case     (.Max,          .Max):                         return  0
            case     (.Max,          _):                            return  1
            case     (_,             .Max):                         return -1

            case let (.OpenLow(v1),  .OpenLow(v2))  where v1 <  v2: return -1
            case let (.OpenLow(v1),  .OpenLow(v2))  where v1 == v2: return  0
            case let (.OpenLow(v1),  .OpenLow(v2))  where v1 >  v2: return  1

            case let (.OpenLow(v1),  .Closed(v2))   where v1 <= v2: return -1
            case let (.OpenLow(v1),  .Closed(v2))   where v1 >  v2: return  1

            case let (.OpenLow(v1),  .OpenHigh(v2)) where v1 <= v2: return -1
            case let (.OpenLow(v1),  .OpenHigh(v2)) where v1 >  v2: return  1

            case let (.Closed(v1),   .OpenLow(v2))  where v1 <  v2: return -1
            case let (.Closed(v1),   .OpenLow(v2))  where v1 >= v2: return  1

            case let (.Closed(v1),   .Closed(v2))   where v1 <  v2: return -1
            case let (.Closed(v1),   .Closed(v2))   where v1 == v2: return  0
            case let (.Closed(v1),   .Closed(v2))   where v1 >  v2: return  1

            case let (.Closed(v1),   .OpenHigh(v2)) where v1 <= v2: return -1
            case let (.Closed(v1),   .OpenHigh(v2)) where v1 >  v2: return  1

            case let (.OpenHigh(v1), .OpenLow(v2))  where v1 <  v2: return -1
            case let (.OpenHigh(v1), .OpenLow(v2))  where v1 >= v2: return  1

            case let (.OpenHigh(v1), .Closed(v2))   where v1 <  v2: return -1
            case let (.OpenHigh(v1), .Closed(v2))   where v1 >= v2: return  1

            case let (.OpenHigh(v1), .OpenHigh(v2)) where v1 <  v2: return -1
            case let (.OpenHigh(v1), .OpenHigh(v2)) where v1 == v2: return  0
            case let (.OpenHigh(v1), .OpenHigh(v2)) where v1 >  v2: return  1
            default:                                                preconditionFailure("Unreachable")
        }
    }

    static func compare(_ lhs: T, _ rhs: TJBoundType) -> Int {
        return compare(.Closed(lhs), rhs)
    }

    static func compare(_ lhs: TJBoundType, _ rhs: T) -> Int {
        return compare(lhs, .Closed(rhs))
    }

    static func ==(lhs: TJBoundType, rhs: TJBoundType) -> Bool {
        return compare(lhs, rhs) == 0
    }

    static func !=(lhs: TJBoundType, rhs: TJBoundType) -> Bool {
        return compare(lhs, rhs) != 0
    }

    static func >(lhs: TJBoundType, rhs: TJBoundType) -> Bool {
        return compare(lhs, rhs) > 0
    }

    static func <(lhs: TJBoundType, rhs: TJBoundType) -> Bool {
        return compare(lhs, rhs) < 0
    }

    static func >=(lhs: TJBoundType, rhs: TJBoundType) -> Bool {
        return compare(lhs, rhs) >= 0
    }

    static func <=(lhs: TJBoundType, rhs: TJBoundType) -> Bool {
        return compare(lhs, rhs) <= 0
    }

    static func ==(lhs: T, rhs: TJBoundType) -> Bool {
        return compare(lhs, rhs) == 0
    }

    static func !=(lhs: T, rhs: TJBoundType) -> Bool {
        return compare(lhs, rhs) != 0
    }

    static func >(lhs: T, rhs: TJBoundType) -> Bool {
        return compare(lhs, rhs) > 0
    }

    static func <(lhs: T, rhs: TJBoundType) -> Bool {
        return compare(lhs, rhs) < 0
    }

    static func >=(lhs: T, rhs: TJBoundType) -> Bool {
        return compare(lhs, rhs) >= 0
    }

    static func <=(lhs: T, rhs: TJBoundType) -> Bool {
        return compare(lhs, rhs) <= 0
    }

    static func ==(lhs: TJBoundType, rhs: T) -> Bool {
        return compare(lhs, rhs) == 0
    }

    static func !=(lhs: TJBoundType, rhs: T) -> Bool {
        return compare(lhs, rhs) != 0
    }

    static func >(lhs: TJBoundType, rhs: T) -> Bool {
        return compare(lhs, rhs) > 0
    }

    static func <(lhs: TJBoundType, rhs: T) -> Bool {
        return compare(lhs, rhs) < 0
    }

    static func >=(lhs: TJBoundType, rhs: T) -> Bool {
        return compare(lhs, rhs) >= 0
    }

    static func <=(lhs: TJBoundType, rhs: T) -> Bool {
        return compare(lhs, rhs) <= 0
    }
}

