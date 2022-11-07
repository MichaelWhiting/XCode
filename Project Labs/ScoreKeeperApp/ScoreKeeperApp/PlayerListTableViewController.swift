//
//  PlayerListTableViewController.swift
//  ScoreKeeperApp
//
//  Created by Michael Whiting on 11/3/22.
//

import UIKit

class PlayerListTableViewController: UITableViewController, AddPlayerTableViewControllerDelegate, PlayerViewTableCellDelegate {
    func updateColor(_ controller: PlayerTableViewCell, updateColor color: UIColor, path indexPath: Int) {
        print("This function ran!")
        print(players[indexPath])
        players[indexPath].color = color
    }
    
    func stepperChanged(_ controller: PlayerTableViewCell, sortPlayer changed: Bool, playerScore updatedValue: Int, path indexPathRow: Int) {
        if changed {
            players[indexPathRow].score = updatedValue
            sortScores()
            tableView.reloadData()
        }
    }
    

  

    func addPlayer(_ controller: AddPlayerTableViewController, addPlayer newPlayer: Player) {
        players.append(newPlayer)
        sortScores()
        tableView.reloadData()
    }
    
    var players: [Player] = [Player(name: "Player 1", score: 10),Player(name: "Player 2", score: 32),Player(name: "Player 3", score: 5)]
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func sortScores() {
        players.sort { $0.score > $1.score }
    }
    
    @IBSegueAction func addPlayer(_ coder: NSCoder, sender: Any?) -> AddPlayerTableViewController? {
        let addPlayerVC = AddPlayerTableViewController(coder: coder)
        addPlayerVC?.delegate = self
        return addPlayerVC
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerTableViewCell
        
        let player = players[indexPath.row]

        cell.delegate = self
        cell.updateCell(with: player)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

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
