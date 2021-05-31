//
//  ViewController.swift
//  StopWatch
//
//  Created by SERGEY VOROBEV on 31.05.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    
    // MARK: - Properties
    private var timer: Timer?
    private var isCounterStarted = false
    private var seconds = 0.0
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - IBOutlets
    @IBAction func startStopButtonTapped(_ sender: UIButton) {
        
        if !isCounterStarted {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                self.seconds += timer.timeInterval
                self.counterLabel.text = String(format: "%.1f", self.seconds)
            }
            
            startStopButton.setTitle("Stop", for: .normal)
        } else {
            timer?.invalidate()
            
            startStopButton.setTitle("Start", for: .normal)
        }
        
        isCounterStarted = !isCounterStarted
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        seconds = 0.0
    }
    
}

