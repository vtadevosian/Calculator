//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Vahram Tadevosian on 6/28/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    private var intermediateCalculation: (number1: Double, operation: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    private func calculateWithTwoOperands(number2: Double) -> Double? {
        guard let number1 = intermediateCalculation?.number1,
            let operation = intermediateCalculation?.operation else { return nil }
        
        switch operation {
        case "+":
            return number1 + number2
        case "-":
            return number1 - number2
        case "×":
            return number1 * number2
        case "÷":
            return number2 != 0 ? number1 / number2 : .infinity
        default:
            fatalError("The passed operation does not match any of the possible cases.")
        }
    }
    
    mutating func calculate(symbol: String) -> Double? {
        guard let number = number else { return nil }
        
        switch symbol {
        case "C":
            return 0
        case "±":
            return number * -1
        case "%":
            return number * 0.01
        case "=":
            return calculateWithTwoOperands(number2: number)
        default:
            intermediateCalculation = (number1: number, operation: symbol)
        }
        return nil
    }
}
