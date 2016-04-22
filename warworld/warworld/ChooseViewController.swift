//
//  ChooseViewController.swift
//  warworld
//
//  Created by Tracy on 16/4/22.
//  Copyright © 2016年 Tracy. All rights reserved.
//

import Foundation
import UIKit

class ChooseViewController: UIViewController {
    
    @IBAction func turnAnswerVC(sender: AnyObject) {
        let vc = AnswerViewController()
        self.presentViewController(vc, animated: true, completion: nil)
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

