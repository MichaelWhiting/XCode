//
//  ViewController.swift
//  Family Project
//
//  Created by Michael Whiting on 9/23/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jenniferButton: UIButton!
    @IBOutlet weak var karlButton: UIButton!
    @IBOutlet weak var sydneyButton: UIButton!
    @IBOutlet weak var natalieButton: UIButton!
    @IBOutlet weak var michaelButton: UIButton!
    var textData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else { return }
        guard let detailVC = segue.destination as? DetailViewController else { return }
        detailVC.textData = "text"
        
    }
}

