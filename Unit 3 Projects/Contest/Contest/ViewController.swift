//
//  ViewController.swift
//  Contest
//
//  Created by Michael Whiting on 11/22/22.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func submitButtonPressed(_ sender: UIButton) {
        if emailTextField.text != "" {
            performSegue(withIdentifier: "Submitted", sender: self)
        } else {
            textFieldBounce()
            return
        }
    }
    
    
    func textFieldBounce() {
        UIView.animate(withDuration: 0.1, delay: 0) { [self] in
            let translate = CGAffineTransform(translationX: 2, y: 0)
            emailTextField.transform = translate
            
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.emailTextField.transform = .identity
            }
        }
    }
}

