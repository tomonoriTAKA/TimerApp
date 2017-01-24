//
//  ViewController.swift
//  TimerApp
//
//  Created by 高橋知憲 on 2017/01/24.
//  Copyright © 2017年 高橋知憲. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    @IBOutlet weak var tenSecButton: UIButton!
    
    @IBOutlet weak var threeMinButton: UIButton!
    
    @IBOutlet weak var fiveMInButton: UIButton!
    
    
    
    var timer: Timer?
    var currentSeconds = 0
    var maxSeconds = 0
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tenSecButton.isExclusiveTouch = true
        threeMinButton.isExclusiveTouch = true
        fiveMInButton.isExclusiveTouch = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tenSecButtonTapped(_ sender: UIButton) {
        let seconds = 10
        timer?.invalidate()
        if (maxSeconds != seconds ){
            maxSeconds = seconds
            start(seconds: seconds)
            tenSecButton.isEnabled = false
            threeMinButton.isEnabled = true
            fiveMInButton.isEnabled = true
            
        }
    }

    @IBAction func threeMInButtonTapped(_ sender: UIButton) {
        let seconds = 180
        timer?.invalidate()

        if (maxSeconds != seconds ){
            maxSeconds = seconds
            start(seconds: seconds)
            tenSecButton.isEnabled = true
            threeMinButton.isEnabled = false
            fiveMInButton.isEnabled = true
        }
    }
    
    
    @IBAction func fiveMinButtonTapped(_ sender: UIButton) {
        let seconds = 300
        timer?.invalidate()
        if (maxSeconds != seconds ){
            maxSeconds = seconds
            start(seconds: seconds)
            tenSecButton.isEnabled = true
            threeMinButton.isEnabled = true
            fiveMInButton.isEnabled = false
        }
    }
    
    func start(seconds:Int){
        currentSeconds = seconds
        label.text = "残り\(currentSeconds)秒"
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(ViewController.update),
            userInfo: nil,
            repeats: true
        )
    }
    
    func update(){
        currentSeconds -= 1
        label.text = "残り\(currentSeconds)秒"
        if(currentSeconds == 0){
            timer?.invalidate()
            let soundId: SystemSoundID = 1005
            AudioServicesPlayAlertSound(soundId)
        }
    }
    
    func duplicateCheck(seconds:Int){
        maxSeconds = seconds
        
    }
}

