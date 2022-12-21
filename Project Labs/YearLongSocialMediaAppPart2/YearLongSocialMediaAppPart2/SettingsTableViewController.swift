//
//  SettingsTableViewController.swift
//  YearLongSocialMediaAppPart2
//
//  Created by Michael Whiting on 12/6/22.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet var tableViewBackground: UITableView!
    
    @IBOutlet weak var themeColorPicker: UIColorWell!
    
    @IBOutlet weak var aboutMeTextEdit: UITextView!
    
    @IBOutlet weak var darkModeSwitch: UISwitch!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func themeSetButtonPressed(_ sender: UIButton) {
        let color = themeColorPicker.selectedColor ?? .white
        tableViewBackground.backgroundColor = color
    }
    
    
}
