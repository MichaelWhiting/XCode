//
//  ViewController.swift
//  Flashlight Project
//
//  Created by Michael Whiting on 9/2/22.
//

import UIKit

class ViewController: UIViewController {

    var lightOn = false
    @IBOutlet weak var lightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    fileprivate func updateUI() {
        view.backgroundColor = lightOn ? .white : .black
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        lightOn.toggle()
        updateUI()
    }
}

