//
//  PeriodicTimerViewController.swift
//  Example
//
//  Created by Adrian Bobrowski on 12.08.2017.
//
//

import UIKit
import AsyncTimer

final class PeriodicTimerViewController: UIViewController {

    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    
    private lazy var timer: AsyncTimer = {
        return AsyncTimer(interval: .milliseconds(100), repeats: true) { [weak self] in
            self?.updateCurrentTime()
        }
    }()
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.SSS"
        return formatter
    }()
    
    @IBAction private func onStart() {
        self.statusLabel.text = "started"
        self.timer.start()
    }
    
    @IBAction private func onPause() {
        self.statusLabel.text = "paused"
        self.timer.pause()
    }
    
    @IBAction private func onResume() {
        self.statusLabel.text = "resumed"
        self.timer.resume()
    }
    
    @IBAction private func onStop() {
        self.statusLabel.text = "stopped"
        self.timer.stop()
    }
    
    @IBAction private func onRestart() {
        self.statusLabel.text = "restarted"
        self.timer.restart()
    }
    
    private func updateCurrentTime() {
        self.timeLabel.text = self.dateFormatter.string(from: Date())
    }
    
}
