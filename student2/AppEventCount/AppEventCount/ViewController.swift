//
//  ViewController.swift
//  AppEventCount
//
//  Created by Michael Whiting on 10/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    @IBOutlet weak var didFinishLaunchingLabel: UILabel!
    @IBOutlet weak var configurationForConnectingLabel: UILabel!
    @IBOutlet weak var didBecomeActiveLabel: UILabel!
    @IBOutlet weak var willConnectToLabel: UILabel!
    @IBOutlet weak var willResignActiveLabel: UILabel!
    @IBOutlet weak var willEnterForegroundLabel: UILabel!
    @IBOutlet weak var didEnterBackgroundLabel: UILabel!
    
    var didFinishLaunchingCount = 0
    var configurationForConnectingCount = 0
    var didBecomeActiveCount = 0
    var willConnectToCount = 0
    var willResignActiveCount = 0
    var willEnterForeroundCount = 0
    var didEnterBackgroundCount = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        didFinishLaunchingLabel.text = "The app has launched \(didFinishLaunchingCount) times"
        
        configurationForConnectingLabel.text = " configurationForConnecting \(configurationForConnectingCount) times"
        
        didBecomeActiveLabel.text = "didBecomeActive \(didBecomeActiveCount) times"
        
        willConnectToLabel.text = "willConnctedTo \(willConnectToCount) times"
        
        willResignActiveLabel.text = "The app has willResignActive \(willResignActiveCount) times"
        
        willEnterForegroundLabel.text = "The app has willEnterForeground \(willEnterForeroundCount) times"
        
        didEnterBackgroundLabel.text = "The app has didEnterBackground \(didEnterBackgroundCount) times"
    }
}

