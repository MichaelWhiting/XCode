//
//  PlayerListTableViewController.swift
//  ScoreKeeperApp
//
//  Created by Michael Whiting on 11/3/22.
//

import UIKit

protocol PlayerListTableViewControllerDelegate: AnyObject {
    func updatingGamePlayers(_ controller: PlayerListTableViewController, playerList players: [Player], indexPath: IndexPath)
    func updatingGameData(_ controller: PlayerListTableViewController, playerCount: Int, currentRound: Int, currentWinner: Player, indexPath: IndexPath, sortedBy: Int, whoWins: Int)
}

class PlayerListTableViewController: UITableViewController, AddPlayerTableViewControllerDelegate, PlayerViewTableCellDelegate, GameSettingsTableViewCellDelegate {
    func stepperChanged(_ controller: GameSettingsTableViewCell, value: Int, row: Int) {
        currentRound = value
    }
    
    func sortedByChanged(_ controller: GameSettingsTableViewCell, selected: Int, row: Int) {
        self.sortedBy = selected
        sortScores(by: sortedBy)
        tableView.reloadData()
    }

    
    func whoWinsChanged(_ controller: GameSettingsTableViewCell, selected: Int, row: Int) {
        self.whoWins = selected
        tableView.reloadData()
    }
    
    func updateColor(_ controller: PlayerTableViewCell, updateColor color: UIColor, path indexPath: Int) {
        print(players[indexPath])
        players[indexPath].color = color
    }
    
    func stepperChanged(_ controller: PlayerTableViewCell, sortPlayer changed: Bool, playerScore updatedValue: Int, path indexPathRow: Int) {
        players[indexPathRow].score = updatedValue
        sortScores(by: sortedBy)
        tableView.reloadData()
//        var savedI = 0
//        for (i, _) in players.enumerated() {
//            if indexPathRow == 0 || i == 0 {
//                if players[0].score < players[indexPathRow].score {
//                    let saved = players[indexPathRow]
//                    players.remove(at: indexPathRow)
//                    players.insert(saved, at: 0)
//                    tableView.moveRow(at: IndexPath(row: indexPathRow, section: 1), to: IndexPath(row: savedI, section: 1))
//                }
//            } else if players[indexPathRow].score > players[i].score && players[indexPathRow].score < players[i - 1].score {
//                savedI = i
//                let saved = players[indexPathRow]
//                players.remove(at: indexPathRow)
//                players.insert(saved, at: savedI)
//                tableView.moveRow(at: IndexPath(row: indexPathRow, section: 1), to: IndexPath(row: savedI, section: 1))
//                break
//            }
//        }
    }

    func addPlayer(_ controller: AddPlayerTableViewController, addPlayer newPlayer: Player) {
        players.append(newPlayer)
        sortScores(by: sortedBy)
        tableView.reloadData()
    }
    
    var sortedBy: Int = 0
    var whoWins: Int = 0
  
    var currentRound: Int = 1
    
    weak var delegate: PlayerListTableViewControllerDelegate?
    
    init?(coder: NSCoder, players: [Player], indexPath: IndexPath?, sortedBy: Int, whoWins: Int, currentRound: Int) {
        super.init(coder: coder)
        guard let unwrappedIndex = indexPath else { return }
        self.players = players
        self.indexPath = IndexPath.init(row: unwrappedIndex.row, section: unwrappedIndex.section)
        self.sortedBy = sortedBy
        self.whoWins = whoWins
        self.currentRound = currentRound
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var players: [Player] = []
    var indexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        sortScores(by: sortedBy)
    }
    
    func sortScores(by: Int) {
        if by == 0 {
            players.sort { $0.score > $1.score }
        } else {
            players.sort { $1.score > $0.score }
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        guard let indexPath = indexPath else { return }
        var currentWinner: Player
        
        if sortedBy == 0 {
            sortScores(by: whoWins)
            guard let validCurrentWinner = players.first else { return }
            currentWinner = validCurrentWinner
        } else {
            sortScores(by: whoWins)
            guard let validCurrentWinner = players.first else { return }
            currentWinner = validCurrentWinner
        }
        delegate?.updatingGamePlayers(self, playerList: players, indexPath: indexPath)
        delegate?.updatingGameData(self, playerCount: players.count, currentRound: currentRound, currentWinner: currentWinner, indexPath: indexPath, sortedBy: sortedBy, whoWins: whoWins)
    
        dismiss(animated: true)
    }
    
    
    @IBSegueAction func addPlayer(_ coder: NSCoder, sender: Any?) -> AddPlayerTableViewController? {
        let addPlayerVC = AddPlayerTableViewController(coder: coder)
        addPlayerVC?.delegate = self
        return addPlayerVC
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return players.count
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GameSettingsCell", for: indexPath) as! GameSettingsTableViewCell
            cell.delegate = self
            cell.updateSettings(sortedBy: sortedBy, whoWins: whoWins, currentRound: currentRound)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerTableViewCell
            
            let player = players[indexPath.row]

            cell.delegate = self
            cell.updateCell(with: player)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            players.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
  
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 144
        } else {
            return 75
        }
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    

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
