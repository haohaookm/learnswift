//
//  AnswerViewController.swift
//  warworld
//
//  Created by Tracy on 16/4/22.
//  Copyright © 2016年 Tracy. All rights reserved.
//

import Foundation
import UIKit

class AnswerViewController: UIViewController {
    
    
    

    //questions
    let allQuestions = [["鱼为什么不能吃？","A 鳄鱼","B 鲨鱼","C 木鱼","D 飞鱼"],["什么东西越洗越脏？","A 抹布","B 衣服","C 白菜","D 大狗"]]
    let rightAnswer = [3,1]
    var currentQuestion = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //background image
        let backImageView = UIImageView()
        backImageView.frame = CGRectMake(0, 0, 667, 375)
        let image = UIImage(named: "对战背景05@2x.png")
        backImageView.image = image
        self.view.addSubview(backImageView)
        
        //backbutton
        let backButton = UIButton()
        backButton.frame = CGRectMake(20, 163, 50, 50)
        backButton.setImage(UIImage(named: "left_arrow.png"), forState: .Normal)
        self.view.addSubview(backButton)
        
        backButton.addTarget(self, action: Selector("turnBack"), forControlEvents: .TouchUpInside)
        
        //question label
        let questionLabel = UILabel()
        questionLabel.frame = CGRectMake(170, 120, 320, 80)
        questionLabel.text = allQuestions[currentQuestion][0]
        questionLabel.textAlignment = .Center
        self.view.addSubview(questionLabel)
        
        //buttonA,B,C,D
        let buttonA = UIButton()
        buttonA.frame = CGRectMake(100, 250, 220, 40)
        buttonA.setImage(UIImage(named: "平时状态@2x"), forState: .Normal)
        self.view.addSubview(buttonA)
        buttonA.addTarget(self, action: Selector("judgeResult:"), forControlEvents: .TouchUpInside)
        buttonA.tag = 1
        
        let buttonALabel = UILabel()
        buttonALabel.frame = CGRectMake(100, 250, 220, 40)
        buttonALabel.text = allQuestions[currentQuestion][1]
        buttonALabel.textColor = UIColor.whiteColor()
        buttonALabel.textAlignment = .Center
        self.view.addSubview(buttonALabel)
        
        let buttonB = UIButton()
        buttonB.frame = CGRectMake(300, 250, 220, 40)
        buttonB.setImage(UIImage(named: "平时状态@2x"), forState: .Normal)
        self.view.addSubview(buttonB)
        buttonB.addTarget(self, action: Selector("judgeResult:"), forControlEvents: .TouchUpInside)
        buttonB.tag = 2
        
        let buttonBLabel = UILabel()
        buttonBLabel.frame = CGRectMake(300, 250, 220, 40)
        buttonBLabel.text = allQuestions[currentQuestion][2]
        buttonBLabel.textColor = UIColor.whiteColor()
        buttonBLabel.textAlignment = .Center
        self.view.addSubview(buttonBLabel)
        
        let buttonC = UIButton()
        buttonC.frame = CGRectMake(100, 300, 220, 40)
        buttonC.setImage(UIImage(named: "平时状态@2x"), forState: .Normal)
        self.view.addSubview(buttonC)
        buttonC.addTarget(self, action: Selector("judgeResult:"), forControlEvents: .TouchUpInside)
        buttonC.tag = 3
        
        let buttonCLabel = UILabel()
        buttonCLabel.frame = CGRectMake(100, 300, 220, 40)
        buttonCLabel.text = allQuestions[currentQuestion][3]
        buttonCLabel.textColor = UIColor.whiteColor()
        buttonCLabel.textAlignment = .Center
        self.view.addSubview(buttonCLabel)
        
        let buttonD = UIButton()
        buttonD.frame = CGRectMake(300, 300, 220, 40)
        buttonD.setImage(UIImage(named: "平时状态@2x"), forState: .Normal)
        self.view.addSubview(buttonD)
        buttonD.addTarget(self, action: Selector("judgeResult:"), forControlEvents: .TouchUpInside)
        buttonD.tag = 4
        
        let buttonDLabel = UILabel()
        buttonDLabel.frame = CGRectMake(300, 300, 220, 40)
        buttonDLabel.text = allQuestions[currentQuestion][4]
        buttonDLabel.textColor = UIColor.whiteColor()
        buttonDLabel.textAlignment = .Center
        self.view.addSubview(buttonDLabel)
        
        //timetracker label
        let timeLabel = UILabel()
        timeLabel.frame = CGRectMake(50, 30, 80, 30)
        timeLabel.text = "00:00"
        timeLabel.backgroundColor = UIColor.blueColor()
        timeLabel.textColor = UIColor.whiteColor()
        timeLabel.textAlignment = .Center
        self.view.addSubview(timeLabel)
        
        
    }
    
    func judgeResult(sender: UIButton) {
        if sender.tag == rightAnswer[currentQuestion] {
            sender.setImage(UIImage(named: "答对@2x.png"), forState: .Normal)
        }
        else {
            sender.setImage(UIImage(named: "答错@2x.png"), forState: .Normal)
        }
        
    }
    
    func turnBack() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

