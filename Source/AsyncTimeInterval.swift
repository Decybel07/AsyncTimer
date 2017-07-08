//
//  AsyncTimeInterval.swift
//  AsyncTimer
//
//  Created by Adrian Bobrowski on 02.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

public enum AsyncTimeInterval {

    case seconds(Int)
    case milliseconds(Int)
}

internal extension AsyncTimeInterval {

    func times(_ times: Int) -> DispatchTimeInterval {
        switch self {
        case let .seconds(value): return .seconds(value * times)
        case let .milliseconds(value): return .milliseconds(value * times)
        }
    }
}
