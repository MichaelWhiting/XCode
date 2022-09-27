import UIKit

let array1 = ["sheep", "sheep", "sheep", "wolf", "sheep"]
let array2 = ["sheep", "sheep", "wolf"]

func warnSheep(arr: [String]) -> String {
    var n = arr.count
    for animal in arr {
        if animal == "wolf" && n > 1 {
            return "Oi! Sheep number \(n - 1), you are about to be eaten by a wolf!"
        }
        n -= 1
    }
    return "Pls go away and stop eating my sheep"
}

print(warnSheep(arr: array1))
print(warnSheep(arr: array2))
