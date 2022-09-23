//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by Michael Whiting on 9/19/22.
//

import UIKit

class MiddleViewController: UIViewController {

    @IBOutlet weak var middleViewLabel: UILabel!
    var eventNumber: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel(from: "viewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateLabel(from: "viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateLabel(from: "viewDidAppear")

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        updateLabel(from: "viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        updateLabel(from: "viewDidDisappear")
    }
    
    func updateLabel(from: String) {
        if let labelText = middleViewLabel.text {
            middleViewLabel.text = "\(labelText)\nEvent number \(eventNumber) was \(from)"
            eventNumber += 1
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
