//
//  ViewController.swift
//  Year Long Tech Social Media App
//
//  Created by Michael Whiting on 9/29/22.
//

import UIKit

class ViewController: UIViewController, backToMainVC {

    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var aboutInfoLabel: UILabel!
    @IBOutlet var mainViewBackground: UIView!
    
    var darkMode = false

    override func viewDidLoad() {
        super.viewDidLoad()
        let isDarkMode = UserDefaults.standard.bool(forKey: "setDarkMode")
        if isDarkMode {
            print("Should be on dark mode")
            loadingDarkMode(on: true)
        } else {
            print("Should not be on dark mode")
            loadingDarkMode(on: false)
        }
    }
    
    func changeUserName(data: String) {
        self.usernameLabel.text = data
    }
    
    func changeAbout(data: String) {
        self.aboutInfoLabel.text = data
    }
    
    func loadingDarkMode(on: Bool) {
        if on == true {
            mainViewBackground.backgroundColor = .black
            companyNameLabel.textColor = .white
            usernameLabel.textColor = .white
            aboutLabel.textColor = .white
            aboutInfoLabel.textColor = .white
        } else {
            mainViewBackground.backgroundColor = .white
            companyNameLabel.textColor = .black
            usernameLabel.textColor = .black
            aboutLabel.textColor = .black
            aboutInfoLabel.textColor = .black
        }
        
    }
    
    func changeDarkMode(data: Bool) {
        UserDefaults.standard.set(data, forKey: "setDarkMode")
        self.darkMode = data
        if darkMode {
            loadingDarkMode(on: true)
        } else {
            loadingDarkMode(on: false)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
    }
}

