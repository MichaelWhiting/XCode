import UIKit

func selectionSort(arr: [Int]) -> [Int] {
    var sortedArr = arr
    
    for i in 0..<sortedArr.count {
        var currentMin = sortedArr[i] // i changes with each loop, so i will always be the "first" number
        var index = i
        for j in 0..<sortedArr.count {
            if j < i { // it will just continue because it isn't less so no need to set it to current min.
                continue
            }
            if currentMin > sortedArr[j] { // changes the index value so we can use it to remember where to remove the old value at later, also changes the current min num
                currentMin = sortedArr[j]
                index = j
            }
            if j + 1 == sortedArr.count { // this checks to see if the loop going thru checking for the min num is done, if it is, insert the number at the index of the main loop
                sortedArr.insert(currentMin, at: i)
                sortedArr.remove(at: index + 1)

            }
        }
    }

    return sortedArr
}

print(selectionSort(arr: [3,0,1,5,2,9,4,7,6]))



// correct example

func selectionSort(nums: [Int]) -> [Int] {
    var myNums = nums
    
    for i in 0..<myNums.count {
        var smallestNum = myNums[i]
        var index = i
        for j in 0..<myNums.count {
            if j < i {
                continue
            }
            if smallestNum > myNums[j] {
                smallestNum = myNums[j]
                index = j
            }
            if j+1 == myNums.count {
                myNums.insert(smallestNum, at: i)
                myNums.remove(at: index + 1)
            }
        }
    }
    return myNums
}
