//
//  ViewController.swift
//  playDice
//
//  Created by Tracy on 16/4/21.
//  Copyright © 2016年 Tracy. All rights reserved.
//

import UIKit

enum SelectType {
    case big, same, small
}

class ViewController: UIViewController {
    
    
    @IBOutlet var dice1ImageView: UIImageView!
    @IBOutlet var dice2ImageView: UIImageView!
    @IBOutlet var dice3ImageView: UIImageView!
    
    var selectType = SelectType.big
    var dice1Num = 0
    var dice2Num = 0
    var dice3Num = 0
    
    var playerMoney = 1000
    var bossMoney = 1000
    
    func judgeResult () {
        switch selectType {
        case .big:
            if(dice1Num + dice2Num + dice3Num > 11) {
                playerMoney += 30
                bossMoney -= 30
            }
            else {
                playerMoney -= 30
                bossMoney += 30
            }
        case .same:
            if (dice1Num == dice2Num) && (dice2Num == dice3Num) {
                playerMoney += 300
                bossMoney -= 300
            }
            else {
                playerMoney -= 300
                bossMoney += 300
            }
        case .small:
            if dice1Num + dice2Num + dice3Num <= 11 {
                playerMoney += 30
                bossMoney -= 30
            }
            else {
                playerMoney -= 30
                bossMoney += 30
            }
        default:
            break
        }
        playerLabel.text = String(playerMoney)
        bossLabel.text = String(bossMoney)
    }
    
    var imageNum = 0
    var timer: NSTimer?
    

    func changeImage (timer: NSTimer){
        let i1 = arc4random()%6 + 1
        var name = String(i1) + ".jpg"
        var image = UIImage(named: name)
        dice1ImageView.image = image
        dice1Num = (Int)(i1)
        
        let i2 = arc4random()%6 + 1
        name = String(i2) + ".jpg"
        image = UIImage(named: name)
        dice2ImageView.image = image
        dice2Num = (Int)(i2)
        
        let i3 = arc4random()%6 + 1
        name = String(i3) + ".jpg"
        image = UIImage(named: name)
        dice3ImageView.image = image
        dice3Num = (Int)(i3)
        
        imageNum += 1
        if imageNum > 10 {
            timer.invalidate()
            imageNum = 0
        
        judgeResult()
        }
    }
    @IBAction func buyBig(sender: AnyObject) {
        //need a timer to change image
        selectType = .big
        timer?.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "changeImage:", userInfo: nil, repeats: true)
        
    }
    
    @IBAction func buySame(sender: AnyObject) {
        selectType = .same
        timer?.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "changeImage:", userInfo: nil, repeats: true)
    }
    
    @IBAction func buySmall(sender: AnyObject) {
        selectType = .small
        timer?.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "changeImage:", userInfo: nil, repeats: true)
    }
    
    @IBOutlet var playerLabel: UILabel!
    
    @IBOutlet var bossLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

