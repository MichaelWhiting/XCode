import UIKit

// Rock, Paper, Scissors

// Create a function that takes in two strings. The strings will be either "rock", "paper", or "scissors"

// Determine who wins and return a string saying who won

// Examples(Input1, Input2 --> Output):

// "scissors", "paper" --> "Player 1 won!"
// "scissors", "rock" --> "Player 2 won!"
// "paper", "paper" --> "Draw!"

func rockPaperScissors(player1: String, player2: String) -> String {
    let values = [3: "rock", 2: "scissors", 1: "paper"]
    guard let p1 = values.first(where: { $1 == player1.lowercased() }), let p2 = values.first(where: { $1 == player2.lowercased() }) else { return "Invalid Input" }
    guard p1 != p2 else { return "There is a tie" }
    if p1.key == 1 && p2.key == 3 {
        return "Player 1 Wins"
    } else if p2.key == 1 && p1.key == 3 {
        return "Player 2 Wins"
    }
    return p1 > p2 ? "Player 1 wins" : "Player 2 wins"
}


print(rockPaperScissors(player1: "scissors", player2: "paper"))
print(rockPaperScissors(player1: "scissors", player2: "rock"))
print(rockPaperScissors(player1: "Paper", player2: "paper"))
print(rockPaperScissors(player1: "Rock", player2: "paper"))
print(rockPaperScissors(player1: "paper", player2: "rock"))

