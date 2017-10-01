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

    var value: Int {
        if case let .down(value) = self {
            return value
        }
        return Int.max
    }

    var next: Counter {
        return self.offset(by: 1)
    }

    var previous: Counter {
        return self.offset(by: -1)
    }

    private func offset(by offset: Int) -> Counter {
        if case let .down(value) = self {
            return .down(value - offset)
        }
        return self
    }
}
