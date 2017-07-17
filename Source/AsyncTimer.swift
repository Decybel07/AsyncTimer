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
    private weak var terminator: Terminator?

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
        self.init(
            queue: queue,
            interval: interval,
            counter: repeats ? .infinity : .down(1),
            block: { _ in block() },
            completion: {}
        )
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
        self.init(
            queue: queue,
            interval: interval,
            counter: .down(times),
            block: block,
            completion: completion
        )
    }

    private init(
        queue: DispatchQueue,
        interval: DispatchTimeInterval,
        counter: Counter,
        block: @escaping (Int) -> Void,
        completion: @escaping () -> Void
    ) {
        self.queue = queue
        self.counter = counter
        self.interval = interval
        self.block = block
        self.completion = completion
    }

    /// Start the timer
    open func start() {
        self.initCountDown(self.counter)
    }

    /// Stop the timer
    open func stop() {
        self.terminator?.stopped = true
        self.terminator = nil
    }

    /// Restart the timer
    open func restart() {
        self.stop()
        self.start()
    }

    private func initCountDown(_ counter: Counter) {
        guard self.terminator == nil else {
            return
        }
        let terminator = Terminator()
        self.countDown(.now(), counter: counter, with: terminator)
        self.terminator = terminator
    }

    private func countDown(_ time: DispatchTime, counter: Counter, with terminator: Terminator) {
        guard !terminator.stopped else {
            return
        }
        let value = counter.value
        guard value > 0 else {
            self.stop()
            self.block(0)
            self.completion()
            return
        }
        let nextTime = time + self.interval
        self.queue.asyncAfter(deadline: nextTime) { [weak self] in
            self?.countDown(nextTime, counter: counter.next, with: terminator)
        }
        self.block(value)
    }
}
