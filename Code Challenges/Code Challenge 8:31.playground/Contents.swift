import UIKit

let numbersArray = [1,2,2]

func squareSum(numbers: [Int]) -> Int {
    var total = 0
    for numb in numbers {
        total += numb * numb
    }
    return total
}

print(squareSum(numbers: numbersArray))
