//
//  ViewController.swift
//  BMI Calc
//
//  Created by Salil Biswas on 1/22/19.
//  Copyright © 2019 user150447. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // text field for weight input
    @IBOutlet weak var weightInput: UITextField!
    
    // text field for height input
    @IBOutlet weak var heightInput: UITextField!
    
    // text field for BMI Output
    @IBOutlet weak var BMIOutput: UITextField!
    
    // label for category output
    @IBOutlet weak var categoryOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // function connected to calculate BMI button
    @IBAction func calcBMI(_ sender: Any) {
        if let heightStr = heightInput.text {
            if heightStr == "" {
                return
            }
            else {
                if let weightStr = weightInput.text {
                    if weightStr == "" {
                        return
                    }
                    else {
                        if let heightNum = Double(heightStr) {
                            if let weightNum = Double(weightStr) {
                                let BMI: Double = (weightNum) / (heightNum*heightNum)
                                BMIOutput.text = String(BMI)
                                switch BMI {
                                case 1..<15:
                                    categoryOutput.text = "Very severely underweight"
                                case 15...16:
                                    categoryOutput.text = "Severely underweight"
                                case 16..<18.5:
                                    categoryOutput.text = "Underweight"
                                case 18.5..<25:
                                    categoryOutput.text = "Normal"
                                case 25..<30:
                                    categoryOutput.text = "Overweight"
                                case 30..<35:
                                    categoryOutput.text = "Moderately obese"
                                case 35..<40:
                                    categoryOutput.text = "Severely obese"
                                case 40..<60:
                                    categoryOutput.text = "Very severely obese"
                                default:
                                    return
                                }
                                
                        }
                    }
                }
            }
        }
    }
    
}
    // hides the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.weightInput.resignFirstResponder()
        self.heightInput.resignFirstResponder()
        return true
    }

}