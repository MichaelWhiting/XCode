//
//  ViewController.swift
//  1 Lab
//
//  Created by Michael Whiting on 9/1/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func setTextButtonTapped(_ sender: UIButton) {
        self.label.text = self.textField.text
    }
    
    @IBAction func clearTextButtonTapped(_ sender: UIButton) {
        self.label.text = ""
        self.textField.text = ""
    }
}

