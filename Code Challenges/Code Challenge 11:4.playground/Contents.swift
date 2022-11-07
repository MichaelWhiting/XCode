import UIKit
// You are given an array with positive numbers and a non-negative number N. You should find the N-th power of the element in the array with the index N. If N is outside of the array, then return nil. Don't forget that the first element has the index 0.

// Let's look at a few examples:

// array = [1, 2, 3, 4] and N = 2, then the result is 3^2 == 9;
// array = [1, 2, 3] and N = 3, but N is outside of the array, so the result is nil.

func nthPower(arr: [Int], n: Int) -> Int? {
    return arr.count - 1 < n ? nil : Int(pow(Double(arr[n]),Double(n)))
}

if let test1 = nthPower(arr: [1,2,3,4], n: 2) {
    print(test1)
}

let test2 = nthPower(arr: [1,2,3], n: 3) 

