//
//  ViewController.swift
//  swiftbulleyes_ios
//
//  Created by yang on 2018/7/24.
//  Copyright © 2018 yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var slider: UISlider!

    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var scoreSumLabel: UILabel!

    @IBOutlet var roundCountLabel: UILabel!

    var currentValue: Int = 0
    var targetValue :Int = 0 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view?.backgroundColor = UIColor.white
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickAction(_ sender: Any) {
        alertMsg()
    }

    @IBAction func onSliderMove(_ sender: UISlider) {
        currentValue = lroundf(sender.value)
        print("the slider value is \(sender.value)")
    }
    
    private func generateTargetValue(){
        targetValue = 1 + Int(arc4random_uniform(100))
    }
    
    func alertMsg() {
        let msg = "current value is \(currentValue),target value is \(targetValue)"
        let alert = UIAlertController(title: "hello,world", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
//        RandomNumberGenerator.next
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    private func startNewRound(){
        generateTargetValue()
        currentValue = 50
        slider.value = Float(currentValue)
    }

    @IBAction func slideMoveFunc(sender: UISlider) {
    }

    @IBAction func clickStartOver(_ sender: Any) {
        alertMsg()
    }

    @IBAction func infoClick(_ sender: Any) {
    }
}
