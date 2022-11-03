//
//  ViewController.swift
//  FamilyProjectPart2
//
//  Created by Michael Whiting on 11/1/22.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var nameValue: String = "Name"
    var ageValue: String = "Age"
    var descriptionValue: String = "Description"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateInfo()
    }
    
    func updateInfo() {
        nameLabel.text = nameValue
        ageLabel.text = ageValue
        descriptionLabel.text = descriptionValue
    }
}

