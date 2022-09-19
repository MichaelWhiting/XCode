//
//  ViewController.swift
//  Login
//
//  Created by Michael Whiting on 9/16/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var forgotUsername: UIButton!
    @IBOutlet weak var forgotPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else { return }
        
        if sender == forgotUsername {
            segue.destination.navigationItem.title = "Forgot Username"
        } else if sender == forgotPassword {
            segue.destination.navigationItem.title = "Forgot Password"
        } else {
            segue.destination.navigationItem.title = usernameTextField.text
        }
    }

    @IBAction func forgotUserButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ForgotUsernameOrPassword", sender: forgotUsername)
    }
    @IBAction func forgotPasswordButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ForgotUsernameOrPassword", sender: forgotPassword)
    }
}

