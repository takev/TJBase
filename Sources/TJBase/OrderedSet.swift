// OrderedSet - A Swift package with same basic utilities and types.
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

public struct OrderedSet<T> where T: Hashable {
    public typealias Element = T
    public typealias Index = Array<T>.Index

    public var array: Array<T> = []
    var dict: Dictionary<T, Index> = [:]

    public init() {
    }

    public mutating func reserveCapacity(minimumCapacity: Int) {
        array.reserveCapacity(minimumCapacity)
        dict.reserveCapacity(minimumCapacity)
    }

    public mutating func indexAndUpdate(with: T) -> Index {
        if let index = dict[with] {
            return index
        } else {
            let index = array.endIndex

            array.append(with)
            dict[with] = index
            return index
        }
    }

}
