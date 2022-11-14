//
//  GameTableViewCell.swift
//  ScoreKeeperApp
//
//  Created by Michael Whiting on 11/8/22.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var playerAmountLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var currentWinnerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateInfo(with game: Game) {
        gameNameLabel.text = game.name
        guard let playerCount = game.playerCount else { return }
        if playerCount > 1 {
            playerAmountLabel.text = "\(game.playerCount ?? 0) Players"
        } else {
            playerAmountLabel.text = "\(game.playerCount ?? 0) Player"
        }
    
        currentWinnerLabel.text = "Winner: \(game.currentWinner ?? "None")"
    }
}
