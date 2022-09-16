//
//  ViewController.swift
//  InterfaceBuilderControlsActions
//
//  Created by Michael Whiting on 9/1/22.
//

import UIKit

class ViewController: UIViewController {


    // MARK: Properties and Outlets
    @IBOutlet weak var mySLIDER: UITextField!
    
    // MARK: Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: Actions

    @IBAction func nameFieldChanged(_ sender: UITextField) {
        if let text = sender.text {
            print("nameFieldChange \(text)")
        }
    }
    

    @IBAction func nameFieldPrimaryAction(_ sender: UITextField) {
        if let text = sender.text {
            print("keyboard enter presed: \(text)")
        }
    }
}

