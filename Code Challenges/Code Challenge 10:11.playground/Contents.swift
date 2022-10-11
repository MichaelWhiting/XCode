import UIKit

func findShared(arr1: [String], arr2: [String]) -> [String] {
    var sharedElements = [String]()
    
    for element in arr1 {
        if arr2.contains(element) {
            sharedElements.append(element)
        }
    }
    
    return sharedElements
}

print(findShared(arr1: ["bird", "lizard", "fish", "cat"], arr2: ["dog", "cat", "bird"]))

func findDifferent(arr1: [String], arr2: [String]) -> [String] {
    var differentElements = [String]()

    for element in arr1 {
        if !arr2.contains(element) {
            differentElements.append(element)
        } else {
            for word in arr2 {
                if !arr1.contains(word) && !differentElements.contains(word) {
                    differentElements.append(word)
                }
            }
        }
    }
    
    return differentElements
}

print(findDifferent(arr1: ["bird", "lizard", "fish", "cat"], arr2: ["dog", "cat", "bird"]))
