//
//  ViewController.swift
//  Example iOS
//
//  Created by Adrian Bobrowski on 02.07.2017.
//
//

import UIKit
import AsyncTimer

class ViewController: UIViewController {

    @IBOutlet weak var countDownLabel: UILabel!
    
    var timer: AsyncTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.timer = AsyncTimer(interval: .milliseconds(100), times: 600, block: { [weak self] count in
            self?.countDownLabel.text = count.description
        })
    }


    @IBAction func start(_: Any) {
        self.timer.start()
    }
    
    @IBAction func stop(_: Any) {
        self.timer.stop()
    }
    
    @IBAction func restart(_: Any) {
        self.timer.restart()
    }

}

