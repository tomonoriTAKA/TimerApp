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

    var timer: Timer?
    var currentSeconds = 0
    var maxSeconds = 0
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tenSecButtonTapped(_ sender: UIButton) {
        let seconds = 10
        maxSeconds = seconds
        start(seconds: seconds)
    }

    @IBAction func threeMInButtonTapped(_ sender: UIButton) {
        start(seconds: 180)
    }
    
    @IBAction func fiveMinButtonTapped(_ sender: UIButton) {
        start(seconds: 300)
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
        if(currentSeconds < 0){
            timer?.invalidate()
            let soundId: SystemSoundID = 1005
            AudioServicesPlayAlertSound(soundId)
        }
    }
    
    func duplicateCheck(seconds:Int){
        maxSeconds = seconds
        
    }
}

