import UIKit

// Create a function that counts the number of times a particular letter shows up in the word search.

let letters = [
    ["D", "E", "Y", "H", "A", "D"],
    ["C", "B", "Z", "Y", "J", "K"],
    ["D", "B", "C", "A", "M", "N"],
    ["F", "G", "G", "R", "S", "R"],
    ["V", "X", "H", "A", "S", "S"]]

func letterSearch(in letters: [[String]], searchFor: String) -> String {
    var returnString = ""
    for (i,row) in letters.enumerated() {
        var timesFoundInRow = 0
        for letter in row {
            if letter == searchFor {
                timesFoundInRow += 1
            }
        }
        returnString.append("The letter \(searchFor) was found \(timesFoundInRow) times in row \(i) \n")
    }
    return returnString
}

print(letterSearch(in: letters, searchFor: "S"))
