//
//  ViewController.swift
//  Magic8Ball
//
//  Created by Michael Whiting on 9/2/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var answerText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func shake(_ sender: UIButton) {
        let randNum = Int.random(in: 1...8)
        
        switch randNum {
        case 1:
            answerText.text = "1"
        case 2:
            answerText.text = "2"
        case 3:
            answerText.text = "3"
        case 4:
            answerText.text = "4"
        case 5:
            answerText.text = "5"
        case 6:
            answerText.text = "6"
        case 7:
            answerText.text = "7"
        case 8:
            answerText.text = "8"
        default:
            print("Error with the app: Number has not assigned the text a value.")
        }
    }
    
    
}

