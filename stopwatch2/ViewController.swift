//
//  ViewController.swift
//  stopwatch2
//
//  Created by Yuto Wakabayashi on 2019/10/27.
//  Copyright © 2019 com.litech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var hanteiLabel: UILabel!
    
    var count: Float = 0.0
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func start() {
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true
            )
        }
        hanteiLabel.text = ""
    }
    
    @IBAction func stop() {
        if timer.isValid {
            timer.invalidate()
        }
        self.hantei()
    }
    
    
    @IBAction func reset() {
        timer.invalidate() //無効にする
        count = 0.0 //0.0を代入
        label.text = String(format: "%.2f", count)
        hanteiLabel.text = "---"
    }
    
    
    @objc func up() {  //メソッド
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    
    @objc func hantei() {
        if count >= 9.80 && count <= 10.20 {
            hanteiLabel.text = "PERFECT!"
        }else if count >= 9.70 && count <= 10.30{
            hanteiLabel.text = "GREAT!"
        }else if count >= 9.60 && count <= 10.40{
            hanteiLabel.text = "GOOD!"
        }else if count >= 9.50 && count <= 10.50{
            hanteiLabel.text = "BAD..."
        }
    }
}

