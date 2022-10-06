import UIKit

func insertionSort(arr: [Int]) -> [Int] {
    var newArr = arr
    
    for x in 1..<newArr.count {
        var y = x
        while y > 0 && newArr[y] < newArr[y - 1] {
            newArr.swapAt(y - 1, y)
            y -= 1
        }
    }
    
    return newArr
}

print(insertionSort(arr: [1,6,2,4,3,5,9,7,8]))
