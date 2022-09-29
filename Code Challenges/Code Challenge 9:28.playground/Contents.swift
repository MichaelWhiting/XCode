import UIKit

func numberTable(num: Int) -> String {
    var newString = ""
    for numb in 1...10 {
        newString += ("\(numb) * \(num) = \(numb * num) \n")
    }

    return newString
}

print(numberTable(num: 5))
