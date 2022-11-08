import UIKit

// When provided with a letter, return its position in the alphabet.

// Input :: "a"

// Ouput :: "Position of alphabet: 1"

func posInAlpha(letter: String) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyz"
    guard letters.contains(letter) else { return "Input is not a valid letter" }
    
    for (i, letter2) in letters.enumerated() {
        if String(letter2) == letter.lowercased() {
            return "Position: \(String(i + 1))"
        }
    }
    
    return "Error: Letter not found"
}

print(posInAlpha(letter: "a"))
print(posInAlpha(letter: "z"))
