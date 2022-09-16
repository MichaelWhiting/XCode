import UIKit

var numValues: [Int] = [2,4,8,10,20]

func multByFive(_ numbers: [Int]) -> [Int] {
    var returnNums = [Int]()
    for numb in numbers {
        returnNums.append(numb * 5)
    }
    return returnNums
}

print(multByFive(numValues))
