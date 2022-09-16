import UIKit

let numbersString = "1948280"

func convertToOneZero(numbers: String) -> String {
    var newString = ""

    for char in numbers {
        if let intValue = char.wholeNumberValue {
            if intValue < 5 {
                newString += "0"
            } else if intValue >= 5 {
                newString += "1"
            }
        }
    }
    return newString
}

print(convertToOneZero(numbers: numbersString))

