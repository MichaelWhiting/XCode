import UIKit


struct Player {
    var name: String
    var score: Int
}

var players = [Player(name: "michael", score: 32),Player(name: "john", score: 64), Player(name: "Jackson", score: 4)]

print(players)
players.sort { $0.score > $1.score }
print(players)
