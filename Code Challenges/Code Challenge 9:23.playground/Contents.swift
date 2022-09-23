import UIKit


let array1: [Any] = ["programming", "coding", "word", "words"]
let array2: [Any] = [1, 2, 3, 4, 5, 6, 8]

func searchForX(arr: [Any], x: Any) -> Bool {
    for thing in arr {
        if String(describing: thing).lowercased() == String(describing: x).lowercased() {
             print("The item is in the array.")
             return true
        } else {
            continue
        }
    }
    print("The item is not in the array")
    return false
}

print(searchForX(arr: array1, x: "Word"))
print(searchForX(arr: array2, x: 7))

