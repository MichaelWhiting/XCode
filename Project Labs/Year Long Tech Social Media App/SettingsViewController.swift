//
//  SettingsViewController.swift
//  Year Long Tech Social Media App
//
//  Created by Michael Whiting on 9/29/22.
//

import UIKit

protocol backToMainVC {
    func changeDarkMode(data: Bool)
    func changeUserName(data: String)
    func changeAbout(data: String)
}

class SettingsViewController: UIViewController {

    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet var mainViewBackground: UIView!
    @IBOutlet weak var changeUsernameLabel: UILabel!
    @IBOutlet weak var changeUsernameTextField: UITextField!
    @IBOutlet weak var changeAboutLabel: UILabel!
    @IBOutlet weak var changeAboutTextField: UITextField!
    
    var delegate: backToMainVC? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let switchOn = UserDefaults.standard.bool(forKey: "switchState")
        switchChangeBackground(on: switchOn)
    }
    
    @IBAction func setUsernameButton(_ sender: UIButton) {
        guard let usernameText = changeUsernameTextField.text else { return }
        if self.delegate != nil {
            let dataToSend = usernameText
            self.delegate?.changeUserName(data: dataToSend)
        }
    }
    
    @IBAction func setAboutButton(_ sender: UIButton) {
        guard let aboutText = changeAboutTextField.text else { return }
        if self.delegate != nil {
            let dataToSend = aboutText
            self.delegate?.changeAbout(data: dataToSend)
        }
    }
    
    func switchChangeBackground(on: Bool) {
        if on {
            darkModeSwitch.isOn = true
            mainViewBackground.backgroundColor = .black
            darkModeLabel.textColor = .white
            changeUsernameLabel.textColor = .white
            changeAboutLabel.textColor = .white
        } else {
            darkModeSwitch.isOn = false
            mainViewBackground.backgroundColor = .white
            darkModeLabel.textColor = .black
            changeUsernameLabel.textColor = .black
            changeAboutLabel.textColor = .black
        }
    }
    
    
    @IBAction func darkModeSwitchChanged(_ sender: UISwitch) {
        if darkModeSwitch.isOn {
            UserDefaults.standard.set(sender.isOn, forKey: "switchState")
            switchChangeBackground(on: true)
            if self.delegate != nil {
                let dataToSend = darkModeSwitch.isOn
                self.delegate?.changeDarkMode(data: dataToSend)
                dismiss(animated: true, completion: nil)
            }
        } else {
            UserDefaults.standard.set(sender.isOn, forKey: "switchState")
            switchChangeBackground(on: false)
            if self.delegate != nil {
                let dataToSend = darkModeSwitch.isOn
                self.delegate?.changeDarkMode(data: dataToSend)
                dismiss(animated: true, completion: nil)
            }
        }
    }
}
