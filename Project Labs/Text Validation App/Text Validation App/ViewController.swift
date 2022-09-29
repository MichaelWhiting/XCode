//
//  ViewController.swift
//  Text Validation App
//
//  Created by Michael Whiting on 9/29/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    let specialChars = ["@",".","!","#","$","%","^","&","<",">","?","+","=","-"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func submitButtonClicked(_ sender: UIButton) {
        guard let unwrappedUsername = usernameTextField.text else { return }
        guard let unwrappedPassword = passwordTextField.text else { return }
        var hasSpecicalChar = false
        var hasUppercaseChar = false
        var hasLowercaseChar = false
        var validEmail = false
        var validPassword = false
        if unwrappedPassword.count >= 8 {
            for char in specialChars {
                if unwrappedPassword.contains(char) {
                    hasSpecicalChar = true
                }
                for char2 in unwrappedPassword {
                    if char2.isUppercase {
                        hasUppercaseChar = true
                    } else {
                        hasLowercaseChar = true
                    }
                }
            }
            if hasSpecicalChar && hasUppercaseChar {
                passwordErrorLabel.textColor = .green
                validPassword = true
                passwordErrorLabel.text = "Password is valid"
            } else {
                passwordErrorLabel.textColor = .systemRed
                if hasUppercaseChar == false {
                    passwordErrorLabel.text = "Password needs an uppercased letter."
                } else if hasLowercaseChar == false {
                    passwordErrorLabel.text = "Password needs a lowercased letter."
                } else {
                    passwordErrorLabel.text = "Password needs a special character."
                }
            }
        } else {
            passwordErrorLabel.textColor = .systemRed
            passwordErrorLabel.text = "Password is not long enough"
        }
        
        if unwrappedUsername.contains("@") && unwrappedUsername.contains(".com") {
            errorLabel.textColor = .green
            errorLabel.text = "Email is valid"
            validEmail = true
        } else {
            errorLabel.textColor = .systemRed
            errorLabel.text = "Email is missing an @ or .com"
        }
        
        if validEmail && validPassword {
            errorLabel.textColor = .green
            errorLabel.text = "Both email and password are valid"
            passwordErrorLabel.text = "Successfully logged in"
        }
    }
    
}

