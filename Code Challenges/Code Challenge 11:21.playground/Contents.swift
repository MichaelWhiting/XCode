import UIKit

// Your task is to implement a function that calculates the sum of the integers inside a string. For example, in the string "The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog", the sum of the integers is 3635.

func sumOfIntegersInString(_ string: String) -> Int {
    var numberStr = ""
    var total = 0

    for char in string {
        if Int(String(char)) != nil {
            numberStr.append(char)
        } else {
            total += Int(numberStr) ?? 0
            numberStr = ""
        }
    }
    
    return total
}

print(sumOfIntegersInString("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog"))
