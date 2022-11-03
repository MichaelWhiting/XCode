//
//  HomeViewController.swift
//  YearLongSocialMediaAppPart2
//
//  Created by Michael Whiting on 11/2/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var profilePictureBackground: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundImage(label: profilePictureBackground)

    }
    
    func roundImage(label: UILabel) {
        label.layer.borderWidth = 1
        label.layer.masksToBounds = false
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.cornerRadius = label.frame.height / 2
        label.clipsToBounds = true
    }


}
