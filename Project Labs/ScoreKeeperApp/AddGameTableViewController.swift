//
//  AddGameTableViewController.swift
//  ScoreKeeperApp
//
//  Created by Michael Whiting on 11/8/22.
//

import UIKit

protocol AddGameTableViewControllerDelegate: AnyObject {
    func addGame(_ controller: AddGameTableViewController, game newGame: Game)
}

class AddGameTableViewController: UITableViewController {

    weak var delegate: AddGameTableViewControllerDelegate?
    
    @IBOutlet weak var gameNameTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var sortedBy: UISegmentedControl!
    @IBOutlet weak var whoWins: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        
    }
    
    func updateSaveButton() {
        guard gameNameTextField.text != nil else { return }
        saveButton.isEnabled = true
    }

    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let gameName = gameNameTextField.text else { return }
        let sortedBy = sortedBy.selectedSegmentIndex
        let whoWins = whoWins.selectedSegmentIndex
        let newGame = Game(name: gameName, whoWins: whoWins, sortBy: sortedBy, rounds: 1, currentRound: 1)
        delegate?.addGame(self, game: newGame)
        dismiss(animated: true)
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func textFieldChanged(_ sender: Any) {
        updateSaveButton()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
