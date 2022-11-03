import UIKit

func findPlural(arr: [String]) {
    for string in arr {
        if string.last?.lowercased() == "s" {
            print(string)
        }
    }
}

findPlural(arr: ["Dollars","Dollar","Penguin", "Penguins", "Sandwhiches"])

//func findPluralReturnArr(arr: [String]) -> [String] {
//    var returnArr = [String]()
//
//    for string in arr {
//        if string.last?.lowercased() == "s" {
//            returnArr.append(string)
//        }
//    }
//
//    return returnArr
//}

//print(findPluralReturnArr(arr: ["Dollars","Dollar","Penguin", "Penguins", "Sandwhiches"]))

