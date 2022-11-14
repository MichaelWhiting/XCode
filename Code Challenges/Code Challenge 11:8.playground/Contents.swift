import UIKit

func sumAll(arr: [Int]) -> Int {
    var sorted = arr.sorted()
    sorted.removeFirst()
    sorted.removeLast()
    return sorted.reduce(0, +)
    // return array.sorted().dropFirst.dropLast().reduce(0,+)
}

print(sumAll(arr: [6,2,1,8,10]))
print(sumAll(arr: [1,1,11,2,3]))

