import UIKit

let numberArray: [Int] = [1,2,3,4,6,7,8]

func consecutive(numbers: [Int]?) -> [Int]? {
    var notConsecutive = false
    var previousNumb = numberArray[0]
    if let numbers = numbers {
        for numb in numbers {
            if numb - 1 == previousNumb {
                continue
            } else {
                notConsecutive = true
            }
        }
        if notConsecutive {
            return nil
        } else {
            return numbers
        }
    } else {
        
    }
}

print(consecutive(numbers: numberArray))

func firstNonConsecutiveNumber(in array: [Int]) -> Int? {
    // go inside array, and compare every number to the previous number
    var compareNum: Int = array.first!
    for int in array.dropFirst() {
        if int != compareNum + 1 {
            return int
        } else {
            compareNum = int
        }
    }
    return nil
}



func consecutive(input: [Int]) -> Int? {
    for i in 1..<input.count {
        if input[i] != input[i - 1] + 1 {
            return input[i]
        }
    }
    return nil
}
var myArray = [1, 2, 3, 4, 5, 6, 13]
print(consecutive(input: myArray)!)
