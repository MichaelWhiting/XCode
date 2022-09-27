//
//  ViewController.swift
//  Family Project V2
//
//  Created by Michael Whiting on 9/26/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myFamilyLabel: UILabel!
    @IBOutlet weak var jenniferButton: UIButton!
    @IBOutlet weak var karlButton: UIButton!
    @IBOutlet weak var sydneyButton: UIButton!
    @IBOutlet weak var natalieButton: UIButton!
    @IBOutlet weak var michaelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myFamilyLabel.layer.masksToBounds = true
        myFamilyLabel.layer.cornerRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton? else { return }
        guard let detailVC = segue.destination as? DetailViewController else { return }
        if sender == jenniferButton {
            segue.destination.navigationItem.title = "Jennifer"
            detailVC.person = "Jennifer"
            detailVC.textData = "Jennifer is my mom. She is 49 years old. She is kind and loves interacting with other people."
        } else if sender == karlButton {
            segue.destination.navigationItem.title = "Karl"
            detailVC.person = "Karl"
            detailVC.textData = "Karl is my dad. He prefers to go by his middle name Brent. He is 50 years old."
        } else if sender == sydneyButton {
            segue.destination.navigationItem.title = "Sydney"
            detailVC.person = "Sydney"
            detailVC.textData = "Sydney is my older sister and she is 23 years old. She currently lives in New York"
        } else if sender == natalieButton {
            segue.destination.navigationItem.title = "Natalie"
            detailVC.person = "Natalie"
            detailVC.textData = "Natalie is my younger sister and she is 14 years old."
        } else if sender == michaelButton {
            segue.destination.navigationItem.title = "Michael"
            detailVC.person = "Michael"
            detailVC.textData = "My name is Michael. I'm 18 years old. Some of my hobbies are playing video games, cooking, and programming."
        }
    }

}

