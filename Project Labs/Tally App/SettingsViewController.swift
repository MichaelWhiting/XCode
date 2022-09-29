//
//  SettingsViewController.swift
//  Tally App
//
//  Created by Michael Whiting on 9/27/22.
//

import UIKit

protocol resetNum {
    func resetNumber(data: Int)
}

class SettingsViewController: UIViewController {

    var resetVal: Int = 0
    var delegate: resetNum? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func resetCounterButton(_ sender: UIButton) {
        if self.delegate != nil {
            let dataToBeSent = resetVal
            self.delegate?.resetNumber(data: dataToBeSent)
            dismiss(animated: true, completion: nil)
        }
    }
}
