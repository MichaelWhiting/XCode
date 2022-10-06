import UIKit


func quicksort(_ a: [Int]) -> [Int] {
    print("printing \(a)")
    guard a.count > 1 else {
        return a
    }
    let pivot = a[a.count / 2] // getting the middle item of the currenet "a" array
    // checking each item that is getting filtered
    let less = a.filter { $0 < pivot } // if the filter item is less than the pivot, puts into less array
    let equal = a.filter { $0 == pivot } // if the filter item is equal to the pivit, puts into equal array
    let greater = a.filter { $0 > pivot } // if the filter item is greater than the pivit, puts into the greater array
    return quicksort(less) + equal + quicksort(greater) // recurrsive return statement to repeat the until the array has been sorted
} //cls
    
    
print(quicksort([1,3,2,9,5,7,6]))


