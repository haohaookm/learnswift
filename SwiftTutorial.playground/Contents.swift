//: Playground - noun: a place where people can play

import UIKit
import Foundation

//
//let swiftTeam = 13
//let iOSTeam = 54
//let otherTeams = 48
//var totalTeam = swiftTeam + iOSTeam + otherTeams
//let priceInferred = 19.99
//let priceExplicit: Double = 19.99
//let onSaleInferred = true
//let nameInferred = "Tiny"
//if onSaleInferred {
//    print("\(nameInferred) on sale for \(priceInferred)!")
//}
//else{
//    print("\(nameInferred) at regular price \(priceInferred)")
//}
//
//
//class TipCalculator {
//    let total: Double
//    let taxPct: Double
//    let subtotal: Double
//    init(total: Double, taxPct: Double) {
//        self.total = total
//        self.taxPct = taxPct
//        subtotal = total / (taxPct + 1)
//    }
//    func calcTipWithPct(tipPct: Double) -> Double {
//        return subtotal * tipPct
//    }
//    func returnPossibleTips() -> [Int:Double] {
//        let possibleTipsInferred = [0.15, 0.18, 0.20]
//        var retval = [Int:Double]()
//        for possibleTip in possibleTipsInferred {
//            let intPct = Int(possibleTip * 100)
//            retval[intPct] = calcTipWithPct(possibleTip)
//        }
//        return retval
//    }
//    
//}
//let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)
//
//tipCalc.returnPossibleTips()
//
//
//let tipAndTotal: (Double, Double) = (4.00, 25.19)
//tipAndTotal.0
//tipAndTotal.1
//
//let (theTipAmt, theTotal) = tipAndTotal
//theTipAmt
//theTotal
//
//let tipAndTotalNamed: (tipAmt: Double, tipTotal: Double) = (4.00, 25.19)
//tipAndTotalNamed.tipAmt
//tipAndTotalNamed.tipTotal
//
//
//let total = 21.19
//let taxPct = 0.06
//let subtotal = total / (taxPct + 1)
//func calcTipWithTipPct(tipPct: Double) -> (tipAmt: Double, total: Double){
//    let tipAmt = subtotal * tipPct
//    let finalTotal = total + tipAmt
//    return (tipAmt, finalTotal)
//}
//calcTipWithTipPct(0.2)
//
//
//@objc protocol Speaker {
//    func Speak()
//    optional func tellJoke()
//}
//class Vicki: Speaker {
//    @objc func Speak() {
//        print("Hello,I'm Vicki")
//    }
//    @objc func tellJoke() {
//        print("Q: What did Sushi A say to Sushi B?")
//    }
//}
//class Tiny: Speaker {
//    @objc func Speak() {
//        print("Hello,I'm Tiny")
//    }
//    @objc func tellJoke() {
//        print("Q: Whats the object-oriented way to become wealthy?")
//    }
//    func writeTutorial(){
//        print("I'm on it")
//    }
//}
//
//class animal {
//    
//}
//class dog: animal, Speaker {
//    @objc func Speak() {
//        print("Woof")
//    }
//}
//
//var speaker: Speaker
//speaker = Tiny()
//speaker.Speak()
//(speaker as! Tiny).writeTutorial()
//speaker = Vicki()
//speaker.Speak()
//speaker.tellJoke?()
//speaker = dog()
//speaker.tellJoke?()
//
//protocol DateSimulatorDelegate {
//    func dateSimulatorDidStart(sim:DateSimulator, a:Speaker, b:Speaker)
//    func dateSimulatorDidEnd(sim:DateSimulator, a:Speaker, b:Speaker)
//}
//
//class LoggingDateSimulator:DateSimulatorDelegate {
//    func dateSimulatorDidStart(sim:DateSimulator, a:Speaker, b:Speaker) {
//        print("Date start")
//    }
//    func dateSimulatorDidEnd(sim:DateSimulator, a:Speaker, b:Speaker) {
//        print("Date end")
//    }
//}
//
//class DateSimulator {
//    let a: Speaker
//    let b: Speaker
//    var delegate:DateSimulatorDelegate?
//    init(a: Speaker, b: Speaker){
//        self.a = a
//        self.b = b
//    }
//    func simulate() {
//        delegate?.dateSimulatorDidStart(self, a:a, b:b)
//        print("Off to dinner...")
//        a.Speak()
//        b.Speak()
//        print("Walking back home")
//        a.tellJoke?()
//        b.tellJoke?()
//        delegate?.dateSimulatorDidEnd(self, a: a, b: b)
//    }
//}
//let sim = DateSimulator(a: Vicki(), b: Tiny())
//sim.delegate = LoggingDateSimulator()
//sim.simulate()


class TipCalculatorModel {
    var total: Double
    var taxPct: Double
    var subtotal: Double {
        get{
            return total / (taxPct + 1)
        }
    }
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
    }
    func calcTipWithPct(tipPct: Double) -> (tipAmt: Double, total: Double){
        let tipAmt = subtotal * tipPct
        let finalTotal = total + tipAmt
        return (tipAmt, finalTotal)
    }
    func returnPossibleTips() -> [Int:(tipAmt:Double, total:Double)] {
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        var retval = [Int:(tipAmt:Double, total:Double)]()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip * 100)
            retval[intPct] = calcTipWithPct(possibleTip)
        }
        return retval
    }
}

class TestDataSource : NSObject, UITableViewDataSource {
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    var possibleTips = Dictionary<Int,(tipAmt:Double, total:Double)>()
    var sortedKeys:[Int] = []
    
    override init() {
        possibleTips = tipCalc.returnPossibleTips()
        sortedKeys = Array(possibleTips.keys).sort()
        super.init()
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedKeys.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: nil)
        let tipPct = sortedKeys[indexPath.row]
        let tipAmt = possibleTips[tipPct]!.tipAmt
        let total = possibleTips[tipPct]!.total
        
        cell.textLabel?.text = "\(tipPct)%:"
        cell.detailTextLabel?.text = String(format: "Tip: $%0.2f, Total: $%0.2f", tipAmt, total)
        return cell
    }
}
let testDataSource = TestDataSource()
let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 320, height: 320), style: .Plain)
tableView.dataSource = testDataSource
tableView.reloadData()





