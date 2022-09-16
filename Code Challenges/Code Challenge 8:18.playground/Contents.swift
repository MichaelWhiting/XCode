import UIKit

let color = "blue"
let number = 50
let letter = "a"

if color == "blue" {
    print("That is my favorite color.")
} else {
    print("Cool!")
}

//color == "blue" ? print("That is my favorite color.") : print("Cool!")

if 1...100 ~= number { // could also be this: number > 0 && number < 100
    print("That is a valid number")
} else {
    print("That is NOT a valid number")
}

//number > 0 && number < 100 ? print("That is a valid number") : print("That is NOT a valid number")

switch letter {
    case "a", "i", "o", "u", "e":
        print("letter is a vowel")
    default:
        print("letter is a consonant")
}
