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

    private var calculator = CalculatorLogic()
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
            if newValue == .infinity {
                displayLabel.text = "lim\n♾"
            } else {
                let textToDisplay = floor(newValue) == newValue ? String(Int(newValue)) : String(newValue)
                displayLabel.text = textToDisplay.truncated(limit: 9, position: .tail)
            }
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
        calculator.setNumber(displayValue)
        
        if let operation = sender.currentTitle {
            if let result = calculator.calculate(symbol: operation) {
                displayValue = result
                if operation == "C" {
                    clearButton.setTitle("AC", for: .normal)
                }
            }
        }
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                guard numValue != "0" else { return }
                
                if numValue == "." {
                    displayLabel.text?.append(".")
                } else {
                    displayLabel.text = numValue
                }
                clearButton.setTitle("C", for: .normal)
                isFinishedTypingNumber = !isFinishedTypingNumber
            } else {
                guard let currentText = displayLabel.text,
                    numValue != "." || !currentText.contains(".") else { return }

                displayLabel.text = currentText.appending(numValue).truncated(limit: 9)
            }
        }
    }
    
}

