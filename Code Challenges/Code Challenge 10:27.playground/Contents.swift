import UIKit

let array: [Int] = [0,1,2,3,4,5,6,7,8,9,10,-11,-12,-13,-14,-15]

func countAndSum(arr: [Int]?) -> [Int]? {
    guard let numbers = arr, numbers != [] else { return nil }
    let positives = numbers.filter { $0 > 0 }
    let negatives = numbers.filter { $0 < 0 }
    return [positives.count, negatives.reduce(0, +)]
}

if let test = countAndSum(arr: array) {
    print(test)
} else {
    print("Error with the data")
}
