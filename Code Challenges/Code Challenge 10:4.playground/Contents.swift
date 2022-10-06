import UIKit

func bubbleSort(arr: [Int]) -> [Int] {
    var newArr = arr
    
    for (i, _) in arr.enumerated() {
        if i + 1 != arr.count {
            var currentNum = arr[i]
            var nextNum = arr[i + 1]
            if currentNum > nextNum {
                let temp = currentNum
                currentNum = nextNum
                nextNum = temp
                newArr.append(currentNum)
                newArr.append(nextNum)
            }
        } else {
        }
    }
    
    return newArr
}


print(bubbleSort(arr: [5,3,6,1,9,8]))
