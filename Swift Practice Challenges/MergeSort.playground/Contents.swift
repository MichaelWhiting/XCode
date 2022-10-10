import UIKit

func mergeSort<T: Comparable>(arr: [T]) -> [T] {
    var newArr = arr
    
    let half = arrToSplit.count / 2
    let left = arrToSplit[0..<half]
    let right = arrToSplit[half..<arrToSplit.count]
    
    let leftArr = mergeSort(Array(array[0..<middleIndex]))
    let rightArr = mergeSort(Array(array[middleIndex..<array.count]))
    
    func merge(leftArr: [T], rightArr: [T]) -> [T] {
        var leftIndex = 0
        var rightIndex = 0
        
    }
    
    return merge(leftArr, rightArr)
}


print(mergeSort(arr: [4,2,3,1]))
