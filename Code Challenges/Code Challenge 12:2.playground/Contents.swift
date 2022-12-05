import UIKit

// Your task it to sum the differences between consecutuive pairs int the array in decending order.

// [2,1,10] -> 9
// Decending order [10,2,1]
// Sum: (10-2) + (2-1) = 8 + 1 = 9

func difference(arr: [Int]) -> Int {
    var newArr = arr.sorted { $0 > $1 }
    var total = 0
    
    for (i,num) in newArr.enumerated() {
        if i != newArr.count - 1 {
            total += num - newArr[i + 1]
        }
    }

    
    return total
}

difference(arr: [2,1,10])



