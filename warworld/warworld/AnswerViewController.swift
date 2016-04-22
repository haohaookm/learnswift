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
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let backImageView = UIImageView()
        backImageView.frame = CGRectMake(0, 0, 667, 375)
        let image = UIImage(named: "对战背景05@2x.png")
        backImageView.image = image
        self.view.addSubview(backImageView)
        
        let backButton = UIButton()
        backButton.frame = CGRectMake(20, 163, 50, 50)
        backButton.setImage(UIImage(named: "left_arrow.png"), forState: .Normal)
        self.view.addSubview(backButton)
        
        backButton.addTarget(self, action: Selector("turnBack"), forControlEvents: .TouchUpInside)
        
    }
    
    func turnBack() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

