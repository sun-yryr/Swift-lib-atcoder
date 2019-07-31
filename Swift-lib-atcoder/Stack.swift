//
//  Stack.swift
//  atcoder_test
//
//  Created by sun-yryr on 2019/07/19.
//  Copyright © 2019 sun-yryr. All rights reserved.
//

import Foundation

struct Stack<T> {
    private var items = [T]()
    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
    func size() -> Int {
        return items.count
    }
    func peek() -> T {
        return items.last!
    }
    func isEmpty() -> Bool {
        return items.isEmpty
    }
    subscript(i: Int) -> T? {
        if i<0 || items.count<=i {
            return nil
        }
        return items[i]
    }
}
