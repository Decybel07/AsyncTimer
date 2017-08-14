//
//  AsyncTimer.swift
//  AsyncTimer
//
//  Created by Adrian Bobrowski on 21.06.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

/// Class AsyncTimer.
open class AsyncTimer {

    private let queue: DispatchQueue
    private let interval: DispatchTimeInterval
    private let counter: Counter

    private let block: (Int) -> Void
    private let completion: () -> Void
    private var task: Task?

    /// A Boolean value that determines whether the timer is paused.
    public var isPaused: Bool {
        return self.task?.isSuspended ?? false
    }

    /// A Boolean value that determines whether the timer is stopped.
    public var isStopped: Bool {
        return self.task == nil
    }

    /// A Boolean value that determines whether the timer is running.
    public var isRunning: Bool {
        return !(self.isStopped || self.isPaused)
    }

    /// An Integer value that determines the number of remaining iterations.
    /// If the timer is infinity or stopped then return nil
    public var value: Int? {
        if let counter = self.task?.counter, case let .down(value) = counter {
            return value
        }
        return nil
    }

    /**
     Initialize a new AsyncTimer. A timer waits until a certain time **interval** has elapsed and then call the **block** clause.

     - parameter queue: The queue on which the timer will start.
     - parameter interval: The time interval between calls to the **block** clause.
     - parameter repeats: If true, the timer will infinity work until stop method called. If false, the timer will be stop after first iteration.
     - parameter block: A closure to be executed when the time **interval** expires. This block has no return value and has no take any argument.

     - returns: A AsyncTimer object.
     */
    public convenience init(
        queue: DispatchQueue = .main,
        interval: DispatchTimeInterval,
        repeats: Bool = false,
        block: @escaping () -> Void = {}
    ) {
        if repeats {
            self.init(queue: queue, interval: interval, counter: .infinity, block: { _ in block() })
        } else {
            self.init(queue: queue, interval: interval, counter: .down(1), completion: block)
        }
    }

    /**
     Initialize a new AsyncTimer. A timer waits until a certain time **interval** has elapsed and then call the **block** clause.

     - parameter queue: The queue on which the timer will start.
     - parameter interval: The time interval between calls to the **block** clause.
     - parameter times: The number of iterations.
     - parameter block: A closure to be executed after changing the number of remaining iterations. This block has no return value and takes single Int argument that indicates number of remaining iterations.
     - parameter completion: A closure to be executed when the timer finishes work. This block has no return value and has no take any argument.

     - returns: A AsyncTimer object.
     */
    public convenience init(
        queue: DispatchQueue = .main,
        interval: DispatchTimeInterval,
        times: Int,
        block: @escaping (Int) -> Void = { _ in },
        completion: @escaping () -> Void = {}
    ) {
        self.init(queue: queue, interval: interval, counter: .down(times), block: block, completion: completion)
    }

    private init(
        queue: DispatchQueue,
        interval: DispatchTimeInterval,
        counter: Counter,
        block: @escaping (Int) -> Void = { _ in },
        completion: @escaping () -> Void = {}
    ) {
        self.queue = queue
        self.counter = counter
        self.interval = interval
        self.block = block
        self.completion = completion
    }

    /// Destroy the timer
    deinit {
        self.stop()
    }

    /// Start the timer
    open func start() {
        guard self.task == nil else {
            return
        }
        self.startTask(Task(self.counter))
    }

    /// Pause the timer
    open func pause() {
        self.task?.isSuspended = true
    }

    /// Resume the timer
    open func resume() {
        guard let task = self.task, task.isSuspended else {
            return
        }
        self.startTask(Task(task))
    }

    /// Stop the timer
    open func stop() {
        self.pause()
        self.task = nil
    }

    /// Restart the timer
    open func restart() {
        self.stop()
        self.start()
    }

    private func startTask(_ task: Task) {
        self.task = task
        self.update(task.getStartTime(), with: task)
    }

    private func update(_ time: DispatchTime, with task: Task) {
        if task.isSuspended {
            return
        }
        if task.isCompleted {
            self.stop()
            self.block(0)
            self.completion()
            return
        }

        task.startedTime = time
        let nextTime = time + self.interval
        self.queue.asyncAfter(deadline: nextTime) { [weak self] in
            self?.update(nextTime, with: task.next)
        }
        self.block(task.counter.value)
    }
}
