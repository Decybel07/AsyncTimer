//
//  CountdownTimerViewController.swift
//  Example
//
//  Created by Adrian Bobrowski on 12.08.2017.
//
//

import UIKit
import AsyncTimer

final class CountdownTimerViewController: UIViewController {

    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    
    private lazy var timer: AsyncTimer = {
        return AsyncTimer(
            interval: .milliseconds(100),
            times: 25,
            block: { [weak self] value in
                self?.valueLabel.text = value.description
            }, completion: { [weak self] value in
                self?.statusLabel.text = "finished"
            }
        )
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
