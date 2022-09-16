import UIKit

var zoo = ["elephant", "Penguins", "Capybara", "red panda", "Aardvark"]

for animal in zoo {
    var printStatement = ""
    let vowels: [Character] = ["a","i","e","o","u"]
    
    if vowels.contains(animal.lowercased().first!) {
        printStatement = "The zoo contains an"
    } else {
        printStatement = "The zoo contains a"
    }
    print("\(printStatement) \(animal)")
}
//---------------------------------------------------
for (index, letter) in "Mississippi".enumerated() {
    print("\(index) Letter: \(letter)")
}

//---------------------------------------------------
var books = ["The Dictionary": 1257, "Harry Potter and the Sorcerer's Stone": 265, "Guliver's Travels": 420]

for (title, pageNum) in books {
    print("The book \(title) has \(pageNum) pages")
}

//---------------------------------------------------

var numberOfLives = 8

while numberOfLives > 0 {
    numberOfLives -= 1
    if numberOfLives == 7 || numberOfLives == 5 {
        continue
    }
    if numberOfLives == 0 {
        print("You just died")
    }
}

var steps = 0
var wall = 2

repeat {
    print("Step")
    
    steps += 1
    
    if steps == wall {
        print("You've hit a wall!")
        break
    }
} while steps < 10
