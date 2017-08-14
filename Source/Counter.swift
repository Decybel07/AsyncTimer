//
//  Counter.swift
//  AsyncTimer
//
//  Created by Adrian Bobrowski on 16.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

internal enum Counter {
    case infinity
    case down(Int)
}

internal extension Counter {

    var next: Counter {
        if case let .down(value) = self {
            return .down(value - 1)
        }
        return self
    }

    var previous: Counter {
        if case let .down(value) = self {
            return .down(value + 1)
        }
        return self
    }

    var value: Int {
        if case let .down(value) = self {
            return value
        }
        return Int.max
    }
}
