//
//  ViewController.swift
//  calci
//
//  Created by DIVYA GAHLOT on 11/06/21.
//

import UIKit
import Eval
class ViewController: UIViewController {
    var value = 0
    var currentExpr = ""
    var totalExpr = ""
    var currResult:NSNumber = 0
    @IBOutlet weak var result: UILabel!;
    @IBOutlet weak var totalExprLabel: UILabel!
    var operators = Array("+-*/")
    
    
    
    @IBAction func ACButton(_ sender: UIButton) {
        currResult = 0
        totalExpr = ""
        result.text  = "0"
        totalExprLabel.text = "0"
        currentExpr = "0"
    }
    
    func evalResult(currentExpr: String) -> NSNumber{
        var numericExpression = "(4 / 3) - 2*7"
        let expression = NSExpression(format: currentExpr)
        
        var result = expression.expressionValue(with: nil, context: nil) as! NSNumber
        print(result)
       
        return result
    }
    
    @IBOutlet weak var equalTo: UIButton!
    
    @IBAction func b1(_ sender: UIButton) {
        buttonValue(currentValue: sender.currentTitle!)
    }
    
    func buttonValue(currentValue:String){
        print("Hi", totalExpr)
        if ((totalExpr == "") || (totalExpr == "0")) {
            totalExprLabel.text = currentValue
        }
        currentExpr = currentExpr + currentValue
        totalExpr = totalExpr + currentValue
        totalExprLabel.text = totalExpr
        if (operators.contains(currentExpr.last! )) {
            
        } else {
            currResult = evalResult(currentExpr: totalExpr)
            currentExpr = currResult.stringValue
            result.text = currentExpr
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

