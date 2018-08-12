//
//  ViewController.swift
//  RunnersApp
//
//  Created by Sourav Sarkar on 26/07/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var time = 0
    var timer = Timer()
    var buttonState = false
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    @IBOutlet weak var stopButton: UIBarButtonItem!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = "0"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func timerFunction(_ sender: Any) {
        if(!buttonState) {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.incrementTimer), userInfo: nil, repeats: true)
            
            buttonState = true
            myButton.setTitle("Stop", for: .normal)
        }else {
            timer.invalidate()
            buttonState = false
            myButton.setTitle("Start", for: .normal)
        }
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        timer.invalidate()
        buttonState = false
        myButton.setTitle("Start", for: .normal)
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        timer.invalidate()
        time = 0
        buttonState = false
        myButton.setTitle("Start", for: .normal)
        timerLabel.text = "0"
    }
    
    @objc func incrementTimer() {
        time = time + 1
        timerLabel.text = String(time)
    }
    
}

