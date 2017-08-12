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
    @IBOutlet private weak var timeLabel: UILabel!
    
    private lazy var timer: AsyncTimer = {
        return AsyncTimer(interval: .seconds(2)) { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }()
    
    @IBAction func onStart() {
        self.statusLabel.text = "started"
        self.timer.start()
    }
    
    @IBAction func onStop() {
        self.statusLabel.text = "stopped"
        self.timer.stop()
    }
    
    @IBAction func onRestart() {
        self.statusLabel.text = "restarted"
        self.timer.restart()
    }
}
