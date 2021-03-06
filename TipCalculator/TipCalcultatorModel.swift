//
//  TipCalcultatorModel.swift
//  TipCalculator
//
//  Created by Tracy on 16/4/12.
//  Copyright © 2016年 Tracy. All rights reserved.
//

import Foundation


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


