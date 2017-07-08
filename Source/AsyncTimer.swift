//
//  AsyncTimer.swift
//  AsyncTimer
//
//  Created by Adrian Bobrowski on 21.06.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

open class AsyncTimer {

    private let queue: DispatchQueue
    private let interval: AsyncTimeInterval
    private let times: Int

    private let block: (Int) -> Void
    private let completion: () -> Void
    private var startTime: DispatchTime!
    private weak var terminator: Terminator?

    public init(
        queue: DispatchQueue = .main,
        interval: AsyncTimeInterval,
        times: Int = 1,
        block: @escaping (Int) -> Void = { _ in },
        completion: @escaping () -> Void = {}
    ) {
        self.queue = queue
        self.times = times
        self.interval = interval
        self.block = block
        self.completion = completion
    }

    open func start() {
        guard self.terminator == nil else {
            return
        }
        let terminator = Terminator()
        self.startTime = .now()
        self.countDown(left: self.times, with: terminator)
        self.terminator = terminator
        return
    }

    open func stop() {
        self.terminator?.stopped = true
        self.terminator = nil
    }

    open func restart() {
        self.stop()
        self.start()
    }

    private func countDown(left counter: Int, with terminator: Terminator) {
        guard !terminator.stopped else {
            return
        }

        guard counter > 0 else {
            self.stop()
            self.block(counter)
            self.completion()
            return
        }

        self.queue.asyncAfter(deadline: self.deadline(for: counter)) { [weak self] in
            self?.countDown(left: counter - 1, with: terminator)
        }
        self.block(counter)
    }

    private func deadline(for counter: Int) -> DispatchTime {
        return self.startTime + self.interval.times(self.times - counter + 1)
    }
}
