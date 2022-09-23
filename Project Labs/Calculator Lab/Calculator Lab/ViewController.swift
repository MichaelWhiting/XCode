//
//  ViewController.swift
//  Calculator Lab
//
//  Created by Michael Whiting on 9/2/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextLabel: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var firstnumlabel: UILabel!
    @IBOutlet weak var secondnumlabel: UILabel!
    @IBOutlet weak var answernumlabel: UILabel!
    
    
    var operatorValue = ""
    var firstNum = ""
    var secondNum = ""
    var answer: Double = 0
    var isOn = "first"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        if clearButton.currentTitle == "Clear" {
            sender.setTitle("AC", for: .normal)
            inputTextLabel.text = "0"
            if isOn == "first"{
                firstNum = ""
            } else if isOn == "second" {
                secondNum = ""
                answer = Double(firstNum)!
            } else {
                operatorValue = ""
                firstNum = ""
                secondNum = ""
                answer = 0
                isOn = "first"
            }
        } else {
            sender.setTitle("AC", for: .normal)
            inputTextLabel.text = "0"
            operatorValue = ""
            firstNum = ""
            secondNum = ""
            answer = 0
            isOn = "first"
        }
        firstnumlabel.text = firstNum
        secondnumlabel.text = secondNum
        answernumlabel.text = String(answer)
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        guard inputTextLabel.text?.first != "0" else {
            clearButton.setTitle("Clear", for: .normal)
            inputTextLabel.text?.removeFirst()
            let number = sender.configuration!.title!
            inputTextLabel.text?.append(number)
            return
        }
        clearButton.setTitle("Clear", for: .normal)
        let number = sender.configuration!.title!
        inputTextLabel.text?.append(number)
        if isOn == "first" {
            firstNum = inputTextLabel.text!
            answer = 0
        } else if isOn == "second" {
            secondNum = inputTextLabel.text!
        }
        firstnumlabel.text = firstNum
        secondnumlabel.text = secondNum
        answernumlabel.text = String(answer)
    }
    
    @IBAction func positiveOrNegativeButton(_ sender: UIButton) {
        if isOn == "first" {
            if firstNum.first != "-" {
                firstNum = "-" + inputTextLabel.text!
                inputTextLabel.text = firstNum
            } else {
                firstNum.removeFirst()
                inputTextLabel.text = firstNum
            }
        } else if isOn == "second" {
            print("its on second num")
            if secondNum.first != "-" {
                secondNum = "-" + inputTextLabel.text!
                inputTextLabel.text = secondNum
            } else {
                secondNum.removeFirst()
                inputTextLabel.text = secondNum
            }
        } else if isOn == "answer" {
            firstNum = String(answer)
            if firstNum.first != "-" {
                firstNum = "-" + inputTextLabel.text!
                inputTextLabel.text = firstNum
            } else {
                firstNum.removeFirst()
                inputTextLabel.text = firstNum
            }
            isOn = "first"
        }
        firstnumlabel.text = firstNum
        secondnumlabel.text = secondNum
        answernumlabel.text = String(answer)
    }
    
    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        isOn = "second"
        operatorValue = sender.configuration!.title!
        firstNum = inputTextLabel.text!
        inputTextLabel.text = "0"
        if operatorValue == "%" {
            isOn = "first"
            answer = Double(firstNum)! / 100.0
            firstNum = String(answer)
            inputTextLabel.text = String(answer)

        }
        firstnumlabel.text = firstNum
        secondnumlabel.text = secondNum
        answernumlabel.text = String(answer)
    }
    
  
    
    @IBAction func equalButtonPressed(_ sender: UIButton) {
        secondNum = inputTextLabel.text!
        isOn = "answer"
        guard let firstNumS = Double(firstNum) else { return }
        guard let secondNumS = Double(secondNum) else { return }
        switch operatorValue {
            case "+":
                answer = firstNumS + secondNumS
            case "-":
                answer = firstNumS - secondNumS
            case "x":
                answer = firstNumS * secondNumS
            case "/":
                answer = firstNumS / secondNumS
            default:
                print("Error with solving the equations with operators.")
        }
        
        if floor(answer) == answer {
            inputTextLabel.text = String(Int(answer))
        } else {
            inputTextLabel.text = String(answer)
        }
        firstnumlabel.text = firstNum
        secondnumlabel.text = secondNum
        answernumlabel.text = String(answer)
        isOn = "first"
    }
}

