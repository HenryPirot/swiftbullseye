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
    var sumScore = 0
    
    var roundValue = 0
    
    
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
        targetLabel?.text = "\(targetValue)"
    }
    
    func alertMsg() {
        let difference = abs(targetValue - currentValue)
        var score = 100 - difference
        sumScore += score
        
        let title:String
        if difference == 0{
            title = "Perfect!"
            score += 100
        }else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                score += 50
            }
        }else if difference < 10 {
            title = "Pretty good"
        }else {
            title = "Not even close"
        }
        let msg = "current value is \(currentValue),\ntarget value is \(targetValue),\ndifference is \(calcDifference())\nyour score is \(score)"
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "ok", style: .default, handler:{ action in self.startNewRound()})
        alert.addAction(action)
//        RandomNumberGenerator.next
        present(alert, animated: true, completion: nil)
        
        scoreSumLabel?.text = String(sumScore)
    }
    
    private func startNewRound(){
        roundValue += 1
        generateTargetValue()
        currentValue = 50
        slider.value = Float(currentValue)
        roundCountLabel?.text = String(roundValue)
    }
    
    @IBAction func onStartOverClick(_ sender: Any) {
        roundValue = 0
        sumScore = 0
        scoreSumLabel?.text = String(sumScore)
        startNewRound()
    }
    
    private func calcDifference() -> Int{
        let difference = abs(currentValue - targetValue)
        return difference
    }
    
    @IBAction func slideMoveFunc(sender: UISlider) {
    }


    @IBAction func infoClick(_ sender: Any) {
    }
}

