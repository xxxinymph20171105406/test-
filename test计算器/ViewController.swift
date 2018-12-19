//
//  ViewController.swift
//  test计算器
//
//  Created by s20171105406 on 2018/12/19.
//  Copyright © 2018 s20171105406. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lb1: UILabel!
    var userIsInTheMiddleOfTypingANumber:Bool = false
    
    @IBAction func append7(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber{
            lb1.text = lb1.text! + digit
        }else{
            lb1.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        
    }
    
    
    @IBAction func operate(_ sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber{
            enter()
            
        }
        switch operation{
        case "×": performOperation { $0 * $1 }
        case "÷": performOperation { $1 / $0 }
        case "+": performOperation { $0 + $1 }
        case "−": performOperation { $1 - $0 }
        default: break
    }
}
func performOperation(operation: (Double,Double)->Double ){
        if operandStack.count >= 2{
            lb1Value = operation(operandStack.removeLast(),operandStack.removeLast())
            enter()
            
        }
    }
    private func perfiomOperation(operation: (Double) ->Double){
        if operandStack.count >= 1{
        lb1Value = operation(operandStack.removeLast())
        enter()
    }
        
}
    var operandStack = Array<Double>()
    
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(lb1Value)
        print(" operandStack = \(operandStack)")
        
    }
    var lb1Value: Double{
        get{
            return NumberFormatter().number(from: lb1.text!)!.doubleValue
        }
        set{
            lb1.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
         }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

