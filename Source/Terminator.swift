//
//  Terminator.swift
//  AsyncTimer
//
//  Created by Adrian Bobrowski on 02.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

internal class Terminator {

    var counter: Counter

    var stopped: Bool = false
    var paused: Bool = false

    var completed: Bool {
        if case let .down(value) = self.counter {
            return value <= 0
        }
        return false
    }

    var next: Terminator {
        self.counter = self.counter.next
        return self
    }

    init(_ counter: Counter) {
        self.counter = counter
    }
}
