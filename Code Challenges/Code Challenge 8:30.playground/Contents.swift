import UIKit

var numbersArray = [1,4,9,10,13,-7,-12]

func evenOrOdd(numbers: [Int]) {
    for numb in numbers {
        if numb % 2 == 0 {
            print("\(numb): Even")
        } else {
            print("\(numb): Odd")
        }
    }
}

print(evenOrOdd(numbers: numbersArray))
