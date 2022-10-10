import UIKit

func medianOfArr(arr1: [Int], arr2: [Int]) -> Double {
    var median: Double
    let mergedArr = (arr1 + arr2).sorted()
    
    if mergedArr.count % 2 == 0 {
        let left = Double(mergedArr[mergedArr.count / 2 - 1])
        let right = Double(mergedArr[mergedArr.count / 2])
        print(left)
        print(right)
        median = (left + right) / 2
    } else {
        median = Double(mergedArr[mergedArr.count / 2])
    }
    
    return median
}

print(medianOfArr(arr1: [1,2], arr2: [3,4]))
