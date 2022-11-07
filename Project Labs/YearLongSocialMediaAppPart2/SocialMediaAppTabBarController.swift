//
//  SocialMediaAppTabBarController.swift
//  YearLongSocialMediaAppPart2
//
//  Created by Michael Whiting on 11/3/22.
//

import UIKit

class SocialMediaAppTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var freshLaunch = true
    override func viewWillAppear(_ animated: Bool) {
        if freshLaunch == true {
            freshLaunch = false
            self.selectedIndex = 1
        }
    }
    
    
}
