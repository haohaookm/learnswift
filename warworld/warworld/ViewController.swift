//
//  ViewController.swift
//  warworld
//
//  Created by Tracy on 16/4/22.
//  Copyright © 2016年 Tracy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lightImageView: UIImageView!
    var timer: NSTimer?
    var lightNum = 0
    
    func changeLight() {
        lightNum += 1
        if lightNum > 12 {
            lightNum = 1
        }
        let image = UIImage(named: "\(lightNum).png")
        lightImageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("changeLight"), userInfo: nil, repeats: true)
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

