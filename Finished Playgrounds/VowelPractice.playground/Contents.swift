import UIKit

let vowels = ["a","e","i","o","u"]

func removeVowels(word: String) -> String {
    var newString = ""
    for char in word.lowercased() {
        if vowels.contains(String(char)) {
            continue
        } else {
            newString += String(char)
        }
    }
    return newString
}

print(removeVowels(word: "Programming"))
