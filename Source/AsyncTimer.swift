//
//  AsyncTimer.swift
//  AsyncTimer
//
//  Created by Adrian Bobrowski on 21.06.2017.
//  Copyright © 2017 Coding lifestyle. All rights reserved.
//

import Foundation

open class AsyncTimer {

    let queue: DispatchQueue
    let interval: DispatchTimeInterval
    let times: Int

    private let block: (Int) -> Void
    private let completion: () -> Void

    private weak var terminator: Terminator?

    public init(
        queue: DispatchQueue = .main,
        interval: DispatchTimeInterval,
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

    private func countDown(left: Int, with terminator: Terminator) {
        guard !terminator.stopped else {
            return
        }

        guard left > 0 else {
            self.stop()
            self.block(left)
            self.completion()
            return
        }

        self.queue.asyncAfter(deadline: DispatchTime.now() + self.interval) { [weak self] in
            self?.countDown(left: left - 1, with: terminator)
        }
        self.block(left)
    }
}
