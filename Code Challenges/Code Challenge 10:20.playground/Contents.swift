import UIKit

func amountOfLetter(_ str: String) -> String {
    var returnStr = ""
    var times = 0
    for letter in str {
        let lowerLetter = letter.lowercased()
        for letter2 in str {
            if lowerLetter == letter2.lowercased() {
                times += 1
            }
        }
        if !returnStr.contains(lowerLetter) {
            returnStr.append("\(lowerLetter): \(times), ")
        }
        times = 0
    }
    return returnStr
}

print(amountOfLetter("This is a string"))
