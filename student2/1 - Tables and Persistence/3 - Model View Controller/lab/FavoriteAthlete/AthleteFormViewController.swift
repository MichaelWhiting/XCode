//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Michael Whiting on 10/17/22.
//

import UIKit

class AthleteFormViewController: UIViewController {

    var athlete: Athlete?

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var leagueTextField: UITextField!
    @IBOutlet weak var teamTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        guard let unwrappedAthlete = athlete as? Athlete
    }

    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
    }


}
