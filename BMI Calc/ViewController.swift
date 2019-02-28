//
//  ViewController.swift
//  BMI Calc
//
//  Created by Salil Biswas on 2/28/19.
//  Copyright © 2019 user150447. All rights reserved.
//

// the app has user inputs for weight and height
// user enters weight in pounds and height in inches
// user clicks the "Calculate my BMI" button and clicks enter
// the app shows BMI value, category and a different emoji for each category
// app converts pounds to kilograms and converts inches to meters and then computes BMI value
// switch is used to display the category and an emoji based on BMI value.

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // text field for weight input in pounds
    @IBOutlet weak var weightInput: UITextField!
    
    // text field for height input in inches
    @IBOutlet weak var heightInput: UITextField!
    
    // text field for BMI Output
    @IBOutlet weak var BMIOutput: UITextField!
    
    // label for category output
    @IBOutlet weak var categoryOutput: UILabel!
    
    // label for emoji output
    @IBOutlet weak var EmojiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
           self.weightInput.delegate = self
           self.heightInput.delegate = self
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
                        // heightInch is the user input for height in inches
                        if let heightInch = Double(heightStr) {
                            // weightLb is the user input for weight in pounds
                            if let weightLb = Double(weightStr) {
                                
                                // weightKg is weight in kilograms
                                // convert from input pounds to kilograms
                                let weightKg = weightLb/(2.204)
                                
                                // heightMtr is height in meters
                                // convert from input inches to meters
                                let heightMtr = heightInch/(39.37)
                                
                                let BMI: Double = (weightKg) / (heightMtr*heightMtr)
                                BMIOutput.text = String(BMI)
                                switch BMI {
                                case 1..<15:
                                    categoryOutput.text = "Very severely underweight "
                                    EmojiLabel.text = "😩"
                                case 15...16:
                                    categoryOutput.text = "Severely underweight "
                                    EmojiLabel.text = "😒"
                                case 16..<18.5:
                                    categoryOutput.text = "Underweight "
                                    EmojiLabel.text = "😕"
                                case 18.5..<25:
                                    categoryOutput.text = "Normal "
                                    EmojiLabel.text = "😀"
                                case 25..<30:
                                    categoryOutput.text = "Overweight "
                                    EmojiLabel.text = "🤔"
                                case 30..<35:
                                    categoryOutput.text = "Moderately obese "
                                    EmojiLabel.text = "🙄"
                                case 35..<40:
                                    categoryOutput.text = "Severely obese "
                                    EmojiLabel.text = "😟"
                                case 40..<60:
                                    categoryOutput.text = "Very severely obese "
                                    EmojiLabel.text = "😮"
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
