//
//  ViewController.swift
//  Image
//
//  Created by Tracy on 16/4/21.
//  Copyright © 2016年 Tracy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    @IBOutlet var myImageView: UIImageView!
    var timer: NSTimer?
    func changeTheImage(timer: NSTimer) {
        //load image
        let image = UIImage(named: "18\(count).pic.jpg")
        myImageView.image = image
        count += 1
        if count > 5 {
            count = 0
        }
    }
    @IBAction func changeImage(sender: AnyObject) {
        timer?.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "changeTheImage:", userInfo: nil, repeats: true)
        
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

