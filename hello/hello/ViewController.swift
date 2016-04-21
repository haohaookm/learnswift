//
//  ViewController.swift
//  hello
//
//  Created by Tracy on 16/4/21.
//  Copyright © 2016年 Tracy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var colorChangeNum = 0
    var clickTimes = 0
    @IBAction func changeText(sender: AnyObject) {
        clickTimes += 1
        myLabel.text = "Hello Tiny! You click \(clickTimes) "
    }
    @IBOutlet var myLabel: UILabel!
    @IBAction func changeColor(sender: AnyObject) {
        colorChangeNum += 1
        if (colorChangeNum == 1){
            myLabel.textColor = UIColor.redColor()
        }
        else if (colorChangeNum == 2){
             myLabel.textColor = UIColor.blueColor()
        }
        else {
            myLabel.textColor = UIColor.greenColor()
            colorChangeNum = 0
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

