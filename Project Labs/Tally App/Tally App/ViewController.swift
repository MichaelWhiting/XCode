//
//  ViewController.swift
//  Tally App
//
//  Created by Michael Whiting on 9/27/22.
//

import UIKit

class ViewController: UIViewController, resetNum {
    @IBOutlet weak var counterValueLabel: UILabel!
    @IBOutlet weak var intervalTextField: UITextField!
    @IBOutlet weak var upOrDownSwitch: UISwitch!
    @IBOutlet weak var goDownLabel: UILabel!
    @IBOutlet weak var goUpLabel: UILabel!
    @IBOutlet weak var addOrTakeButton: UIButton!
    @IBOutlet weak var resetValueTextField: UITextField!

    var valueVar = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func resetNumber(data: Int) {
        print("Data is \(data)")
        self.valueVar = data
        self.counterValueLabel.text = String(valueVar)
    }
    
    @IBAction func changedSwitch(_ sender: UISwitch) {
        if upOrDownSwitch.isOn {
            goDownLabel.textColor = .black
            goUpLabel.textColor = .systemBlue
            addOrTakeButton.setTitle("Add", for: .normal)
        } else {
            goDownLabel.textColor = .systemBlue
            goUpLabel.textColor = .black
            addOrTakeButton.setTitle("Take Away", for: .normal)
        }
    }
    
    @IBAction func changeCounterButton(_ sender: UIButton) {
        guard let unwrappedText = intervalTextField.text else { return }
        if Int(unwrappedText) != nil {
            if upOrDownSwitch.isOn {
                valueVar += Int(unwrappedText)!
                counterValueLabel.text = String(valueVar)
            } else {
                valueVar -= Int(unwrappedText)!
                counterValueLabel.text = String(valueVar)
            }
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let unwrappedText = resetValueTextField.text else { return }
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
        if Int(unwrappedText) != nil {
            settingsVC.resetVal = Int(unwrappedText)!
        } else {
            settingsVC.resetVal = 0
        } 
    }
}
    


