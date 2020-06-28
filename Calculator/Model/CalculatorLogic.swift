//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Vahram Tadevosian on 6/28/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    var number: Double
    
    func calculate(symbol: String) -> Double? {
        if symbol == "C" {
            return 0
        } else if symbol == "±" {
            return number * -1
        } else if symbol == "%" {
            return number * 0.01
        }
        
        return nil
    }
    
}
