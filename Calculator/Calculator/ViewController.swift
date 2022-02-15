//
//  ViewController.swift
//  Calculator
//
//  Created by Aurelio Le Clarke on 14.02.2022.
//

import UIKit

class ViewController: UIViewController {

    var workings: String = ""
    @IBOutlet weak var calculatorWorkings: UILabel!
    
    @IBOutlet weak var calculatorResults: UILabel!
    
    func ClearAll() {
        workings = ""
        calculatorWorkings.text = ""
        calculatorResults.text = ""
    }
    
    func addToWorkings(value: String) {
        workings = workings + value
        calculatorWorkings.text = workings
    }
    
    func formatResult(result: Double) -> String {
        if(result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f",result)
        }else {
            return String(format: "%.2f", result)
        }
    }
    
    func validInput() -> Bool {
      var count = 0
        var charIndexes = [Int]()
        
        for char in workings {
            if(specialCharacter(char: char)) {
                charIndexes.append(count)
            }
        count += 1
        }
        var previous: Int = -1
        
        for index in charIndexes {
            if(index == 0) {
                return false
            }
            if(index == workings.count - 1) {
                return false
            }
            if(previous != -1) {
                if(index - previous == 1) {
                    return false
                }
            }
        previous = index
        }
        
        return true
        
    }
    
    func specialCharacter(char: Character) -> Bool {
        if(char == "*") {
            return true
        }
        if char  == "/" {
            return true
        }
        if char == "-" {
            return true
        }
        if char == "+" {
            return true
        }
    return false
    }
    
    
    
    @IBAction func AllClearButton(_ sender: UIButton) {
    ClearAll()
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        if(!workings.isEmpty) {
            workings.removeLast()
            calculatorWorkings.text = workings
        }
            
    }
    
    
    @IBAction func percentageButton(_ sender: UIButton) {
    addToWorkings(value: "%")
    }
    
    @IBAction func divideButton(_ sender: UIButton) {
        addToWorkings(value: "/")
    }
    
    @IBAction func multiplyButton(_ sender: UIButton) {
        addToWorkings(value: "*")
    }
    
    
    @IBAction func plusButton(_ sender: UIButton) {
        addToWorkings(value: "+")
    }
    
    
    @IBAction func minusButton(_ sender: UIButton) {
        addToWorkings(value: "-")
    }
    
    @IBAction func equalsButton(_ sender: UIButton) {
        if(validInput()) {
        let checkedForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
        let expression = NSExpression(format: checkedForPercent)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatResult(result: result)
        
        calculatorResults.text = resultString
        }else {
            let alert = UIAlertController(title: "Invalid input", message: "Calculator unable to do math based on input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func decimalButton(_ sender: UIButton) {
        addToWorkings(value: ".")
    }
    
    
    @IBAction func zeroButton(_ sender: UIButton) {
        addToWorkings(value: "0")
    }
    
    
    
    @IBAction func OneButton(_ sender: UIButton) {
        addToWorkings(value: "1")
    }
    
    @IBAction func TwoButton(_ sender: UIButton) {
        addToWorkings(value: "2")
    }
    
    @IBAction func ThreeButton(_ sender: UIButton) {
        addToWorkings(value: "3")
    }
    
    
    
    @IBAction func FourButton(_ sender: UIButton) {
        addToWorkings(value: "4")
    }
    
  
    @IBAction func FiveButton(_ sender: UIButton) {
        addToWorkings(value: "5")
    }
    
    
    @IBAction func SixButton(_ sender: UIButton) {
        addToWorkings(value: "6")
    }
    
    
    @IBAction func SevenButton(_ sender: UIButton) {
        addToWorkings(value: "7")
    }
    
    @IBAction func EightButton(_ sender: UIButton) {
        addToWorkings(value: "8")
    }
    
    @IBAction func NineButton(_ sender: UIButton) {
        addToWorkings(value: "9")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       ClearAll()
   
    
    }


}

