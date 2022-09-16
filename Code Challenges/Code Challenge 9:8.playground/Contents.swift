import UIKit
import Darwin

func checkArrays(list1: [Int], list2: [Int]) -> Int? {
    var list1Total = 1
    var list2Total = 1
    for num in list1 {
        if num <= 0 || list1.count != 3 {
            return nil // adding this since we don't want any integers = to or below 0
        }
        list1Total *= num
    }
    for num in list2 {
        if num <= 0 || list2.count != 3 {
            return nil
        }
        list2Total *= num
    }
    return abs(list1Total - list2Total)
}

if let checked = checkArrays(list1: [2,2,3], list2: [5,4,1]) { // practicing optionals
    print(checked)
} else {
    print("Error with one of the dimensions: Below or = to 0")
}





func volumeOfACuboid(_ dimensions: [Int]) -> Int? {
    if dimensions.count != 3 {
        return nil
    }

    return dimensions.reduce(0, *)
}

func difInVolume(a: [Int], b: [Int]) -> Int? {
    if a.count != 3 || b.count != 3 {
        return nil
    }

    if let volA = volumeOfACuboid(a), let volB = volumeOfACuboid(b) {
        return abs(volA - volB)
    }
    
    return nil
}
