//
//  Task.swift
//  AsyncTimer
//
//  Created by Adrian Bobrowski on 02.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

internal class Task {

    var counter: Counter

    var suspendTime: DispatchTime?
    var startedTime: DispatchTime?
    let getStartTime: () -> DispatchTime

    var isSuspended: Bool {
        get {
            return self.suspendTime != nil
        }
        set {
            if self.suspendTime == nil {
                self.suspendTime = .now()
            }
        }
    }

    var isCompleted: Bool {
        if case let .down(value) = self.counter {
            return value <= 0
        }
        return false
    }

    var next: Task {
        self.counter = self.counter.next
        return self
    }

    init(_ counter: Counter) {
        self.counter = counter
        self.getStartTime = { .now() }
    }

    init(_ task: Task) {
        let elapsedTime = task.suspendTime!.uptimeNanoseconds - task.startedTime!.uptimeNanoseconds
        self.counter = task.counter.previous
        self.getStartTime = {
            DispatchTime(uptimeNanoseconds: DispatchTime.now().uptimeNanoseconds - elapsedTime)
        }
    }
}
