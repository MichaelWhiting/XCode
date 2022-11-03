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
    
    init?(coder: NSCoder, athlete: Athlete?) {
        self.athlete = athlete
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        guard let unwrappedAthlete = athlete else { return }
        nameTextField.text = unwrappedAthlete.name
        ageTextField.text = unwrappedAthlete.age
        leagueTextField.text = unwrappedAthlete.league
        teamTextField.text = unwrappedAthlete.team
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let name = nameTextField.text,
              let ageString = ageTextField.text,
              let league = leagueTextField.text,
              let team = teamTextField.text else { return }
        
        athlete = Athlete(name: name, age: ageString, league: league, team: team)
        
        performSegue(withIdentifier: "saveSegue", sender: self)
    }


}
