//
//  ViewController.swift
//  Calculator
//
//  Created by Vahram Tadevosian on 6/28/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var clearButton: UIButton!
    
    private var isFinishedTypingNumber: Bool = true
    private var displayValue: Double {
        get {
            guard let text = displayLabel.text,
                let number = Double(text) else {
                    fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        buttonCollection.forEach { (button) in
            let side = button.frame.size.height
            button.layer.cornerRadius = 0.5 * side
            button.clipsToBounds = true
        }
    }
    
    @IBAction func calcButtonTapped(_ sender: UIButton) {
        isFinishedTypingNumber = true
        if let operation = sender.currentTitle {
            let calculator = CalculatorLogic(number: displayValue)
            guard let result = calculator.calculate(symbol: operation) else {
                fatalError("The result of the calculation is nil.")
            }
            displayValue = result
            
            if operation == "C" {
                clearButton.setTitle("AC", for: .normal)
            }
        }
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                clearButton.setTitle("C", for: .normal)
                isFinishedTypingNumber = !isFinishedTypingNumber
            } else {
                if numValue == "." {
                    if floor(displayValue) == displayValue { return }
                }
                displayLabel.text?.append(numValue)
            }
        }
    }
    
}

