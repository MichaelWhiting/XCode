//
//  Game.swift
//  ScoreKeeperApp
//
//  Created by Michael Whiting on 11/8/22.
//

import Foundation

struct Game {
    var name: String
    var players: [Player]?
    var currentWinner: String?
    var whoWins: Int
    var sortBy: Int
    var playerCount: Int?
    var rounds: Int
    var currentRound: Int
}
