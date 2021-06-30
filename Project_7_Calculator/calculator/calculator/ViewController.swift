//
//  ViewController.swift
//  calculator
//
//  Created by James Hunt on 6/30/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentValueLabel: UILabel!
    
    var lastOperand = Double()
    var currentOperand = Double()
    
    enum Operator:Int {
        case add = 1
        case subtract = 2
        case multiply = 3
        case divide = 4
        case percent = 5
    }
    
    var operation = Operator(rawValue: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if let inputValue = sender.titleLabel?.text {
            currentValueLabel.text?.append(inputValue)
        }
        if let operand = currentValueLabel.text {
            if let operandDouble = Double(operand){
                currentOperand = operandDouble
            }
        }
    }
    @IBAction func clear(_ sender: UIButton) {
        clear()
    }
    @IBAction func switchSign(_ sender: UIButton) {
        currentOperand = currentOperand * -1
        
        if floor(currentOperand) == currentOperand{
            currentValueLabel.text? = "\(Int(currentOperand))"
        }else {
            currentValueLabel.text? = "\(currentOperand)"
        }
    
    }
    
    
    @IBAction func applyOperator(_ sender: UIButton) {
        lastOperand = currentOperand
        operation = Operator(rawValue: sender.tag)
        
        
        currentValueLabel.text? = ""
    }
    
    func clear(){
        lastOperand = 0.0
        currentOperand = 0.0
        currentValueLabel.text? = ""
    }
    @IBAction func evaluate(_ sender: UIButton) {
        var result = Double()
        
        switch operation {
        case .add:
            result = lastOperand + currentOperand
        case .subtract:
            result = lastOperand - currentOperand
        case .multiply:
            result = lastOperand * currentOperand
        case .divide:
            result = lastOperand / currentOperand
        case .percent:
            result = lastOperand * currentOperand * (0.01)
        default:
            print("error")
        }
      
        print(result)
        if floor(result) == result{
            currentValueLabel.text? = "\(Int(result))"
        }else {
            currentValueLabel.text? = "\(result)"
        }
        
        
        currentOperand = result
        lastOperand = 0.0
    }
    
  
}

