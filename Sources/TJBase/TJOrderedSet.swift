//
//  TJOrderedSet.swift
//  TJBaseTests
//
//  Created by Tjienta Vara on 2017-08-01.
//

public struct TJOrderedSet<T> where T: Hashable {
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
