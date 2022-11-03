import UIKit

func multiples(_ num: Int, _ limit: Int) -> [Int] {
    return Array(num...limit).filter { $0 % num == 0 }
}

print(multiples(2,100))


// this version is 2x faster-
func multiples2(_ num: Int, _ limit: Int) -> [Int] {
    var returnArr = [Int]()
    var index = num
    var times = 0
    while index <= limit {
        times += 1
        if num.isMultiple(of: 2) {
            returnArr.append(index)
            index += num
        }
    }
    return returnArr
}

print(multiples2(2, 100))
