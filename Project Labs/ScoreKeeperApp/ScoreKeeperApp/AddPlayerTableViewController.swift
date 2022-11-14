//
//  AddPlayerTableViewController.swift
//  ScoreKeeperApp
//
//  Created by Michael Whiting on 11/3/22.
//

import UIKit

protocol AddPlayerTableViewControllerDelegate: AnyObject {
    func addPlayer(_ controller: AddPlayerTableViewController, addPlayer newPlayer: Player)
}

class AddPlayerTableViewController: UITableViewController {
    
    var player: Player?
    weak var delegate: AddPlayerTableViewControllerDelegate?
    
    @IBOutlet weak var playerTextField: UITextField!
    @IBOutlet weak var scoreTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
    }

    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let name = playerTextField.text else { return }
        guard let score = Int(scoreTextField.text ?? "") else { return }
        
        let newPlayer = Player(name: name, score: score)
        delegate?.addPlayer(self, addPlayer: newPlayer)
        dismiss(animated: true)
    }
    
    func updateSaveButton() {
        guard let score = scoreTextField.text else { return }
        guard playerTextField.text != nil, Int(score) != nil else { return }
        saveButton.isEnabled = true
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
    // MARK: - Table view data source
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
