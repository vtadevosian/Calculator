//
//  ViewController.swift
//  Calculator
//
//  Created by Vahram Tadevosian on 6/28/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet var buttonCollection: [UIButton]!
    
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
    
}

