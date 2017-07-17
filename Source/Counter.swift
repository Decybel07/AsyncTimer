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
        switch self {
        case .infinity: return self
        case let .down(value): return .down(value - 1)
        }
    }

    var value: Int {
        switch self {
        case .infinity: return Int.max
        case let .down(value): return value
        }
    }
}
