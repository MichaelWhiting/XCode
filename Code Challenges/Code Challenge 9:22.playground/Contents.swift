import UIKit


func addToSum(num: Int) -> Int {
    guard num > 0 else { return num }
    return num * (num + 1) / 2
}

print(addToSum(num: 2))
print(addToSum(num: 8))

//    var sum = 0
//
//    for number in 1...num {
//        sum += number
//    }

//    return sum

