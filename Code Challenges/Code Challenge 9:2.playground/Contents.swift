import UIKit

var numbersArray = [4,3,9,7,2,1]

func squareOrRoot(numbers: [Int]) -> [Int] {
    var newArray: [Int] = []
    for numb in numbers {
        let numbSqrt = sqrt(Double(numb))
        let isInt = floor(numbSqrt) == numbSqrt
        if isInt {
           newArray.append(Int(numbSqrt))
        } else {
           newArray.append(numb * numb)
        }
    }
    return newArray
}
    
print(squareOrRoot(numbers: numbersArray))
