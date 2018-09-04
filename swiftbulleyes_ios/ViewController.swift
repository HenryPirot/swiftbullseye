//
//  ViewController.swift
//  swiftbulleyes_ios
//
//  Created by yang on 2018/7/24.
//  Copyright © 2018 yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view?.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickAction(_ sender: Any) {
        let alert = UIAlertController(title: "alert", message: "Hello world,my first app", preferredStyle:.alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

