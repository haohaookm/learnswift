//: Playground - noun: a place where people can play

import UIKit

let swiftTeam = 13
let iOSTeam = 54
let otherTeams = 48
var totalTeam = swiftTeam + iOSTeam + otherTeams
let priceInferred = 19.99
let priceExplicit: Double = 19.99
let onSaleInferred = true
let nameInferred = "Tiny"
if onSaleInferred {
    print("\(nameInferred) on sale for \(priceInferred)!")
}
else{
    print("\(nameInferred) at regular price \(priceInferred)")
}


class TipCalculator {
    let total: Double
    let taxPct: Double
    let subtotal: Double
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
        subtotal = total / (taxPct + 1)
    }
    func calcTipWithPct(tipPct: Double) -> Double {
        return subtotal * tipPct
    }
    func returnPossibleTips() -> [Int:Double] {
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        var retval = [Int:Double]()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip * 100)
            retval[intPct] = calcTipWithPct(possibleTip)
        }
        return retval
    }
    
}
let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)

tipCalc.returnPossibleTips()



