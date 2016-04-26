//
//  ResultViewController.swift
//  warworld
//
//  Created by Tracy on 16/4/25.
//  Copyright © 2016年 Tracy. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    var timeNum = 0
    var totalNum = 0
    var rightNum = 0
    var wrongNum = 0
    
    let backgroundImageView = UIImageView()
    let timeLabel = UILabel()
    let totalLabel = UILabel()
    let rightLabel = UILabel()
    let wrongLabel = UILabel()
    let backButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.frame = CGRectMake(0, 0, 667, 375)
        let image = UIImage(named: "战报背景@2x")
        backgroundImageView.image = image
        self.view.addSubview(backgroundImageView)
        
        timeLabel.frame = CGRectMake(150, 120, 320, 40)
        timeLabel.textColor = UIColor.whiteColor()
        timeLabel.text = "答题用时：\(timeNum)"
        self.view.addSubview(timeLabel)
        
        totalLabel.frame = CGRectMake(150, 160, 320, 40)
        totalLabel.text = "答题总数：\(totalNum)"
        totalLabel.textColor = UIColor.redColor()
        self.view.addSubview(totalLabel)
        
        rightLabel.frame = CGRectMake(150, 200, 320, 40)
        rightLabel.textColor = UIColor.redColor()
        rightLabel.text = "答对题数：\(rightNum)"
        self.view.addSubview(rightLabel)
        
        wrongLabel.frame = CGRectMake(150, 240, 320, 40)
        wrongLabel.textColor = UIColor.redColor()
        wrongLabel.text = "答错题数：\(wrongNum)"
        self.view.addSubview(wrongLabel)
        
        backButton.frame = CGRectMake(5, 163, 50, 50)
        backButton.setImage(UIImage(named: "left_arrow.png"), forState: .Normal)
        self.view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(ResultViewController.turnBack), forControlEvents: .TouchUpInside)
    }
    
    func turnBack() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}