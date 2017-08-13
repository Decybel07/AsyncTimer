//
//  ScheduledTimerViewController.swift
//  Example
//
//  Created by Adrian Bobrowski on 12.08.2017.
//
//

import UIKit
import AsyncTimer

final class ScheduledTimerViewController: UIViewController {

    @IBOutlet private weak var statusLabel: UILabel!
    
    private lazy var timer: AsyncTimer = {
        return AsyncTimer(interval: .seconds(2)) { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
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
    
}
