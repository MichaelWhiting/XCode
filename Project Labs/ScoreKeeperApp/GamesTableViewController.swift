//
//  GamesTableViewController.swift
//  ScoreKeeperApp
//
//  Created by Michael Whiting on 11/8/22.
//

import UIKit

class GamesTableViewController: UITableViewController, AddGameTableViewControllerDelegate, PlayerListTableViewControllerDelegate {

    func updatingGameData(_ controller: PlayerListTableViewController, playerCount: Int, currentRound: Int, currentWinner: Player, indexPath: IndexPath, sortedBy: Int, whoWins: Int) {
        games[indexPath.row].playerCount = playerCount
        games[indexPath.row].currentWinner = currentWinner.name
        games[indexPath.row].sortBy = sortedBy
        games[indexPath.row].whoWins = whoWins
        games[indexPath.row].currentRound = currentRound
        tableView.reloadData()
        print("updated the data")
    }
    
    func updatingGamePlayers(_ controller: PlayerListTableViewController, playerList players: [Player], indexPath: IndexPath) {
        games[indexPath.row].players = players
        tableView.reloadData()
    }

    func addGame(_ controller: AddGameTableViewController, game newGame: Game) {
        games.append(newGame)
        tableView.reloadData()
    }
    

    var games: [Game] = [Game(name: "Game 1", players: [Player(name: "Player 1", score: 10), Player(name: "Player 2", score: 12), Player(name: "Player 3", score: 7)], currentWinner: "Player 2", whoWins: 0, sortBy: 0, playerCount: 3, rounds: 3, currentRound: 1)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }

    @IBSegueAction func addGameSegue(_ coder: NSCoder, sender: Any?) -> AddGameTableViewController? {
        let addGameVC = AddGameTableViewController(coder: coder)
        addGameVC?.delegate = self
        return addGameVC
    }
    
    @IBSegueAction func viewPlayers(_ coder: NSCoder, sender: Any?) -> PlayerListTableViewController? {
        guard let sender = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: sender) else { return nil }
        print("section \(indexPath.section)")
        print("row \(indexPath.row)")
        if games[indexPath.row].players != nil {
            let playerListVC = PlayerListTableViewController(coder: coder, players: games[indexPath.row].players ?? [], indexPath: indexPath, sortedBy: games[indexPath.row].sortBy, whoWins: games[indexPath.row].whoWins, currentRound: games[indexPath.row].currentRound)
            playerListVC?.delegate = self
            return playerListVC
        } else {
            let playerListVC = PlayerListTableViewController(coder: coder, players: games[indexPath.row].players ?? [], indexPath: indexPath, sortedBy: games[indexPath.row].sortBy, whoWins: games[indexPath.row].whoWins, currentRound: games[indexPath.row].currentRound)
            playerListVC?.delegate = self
            return playerListVC
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return games.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as! GameTableViewCell
        
        let game = games[indexPath.row]
        cell.updateInfo(with: game)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            games.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42
    }
}
