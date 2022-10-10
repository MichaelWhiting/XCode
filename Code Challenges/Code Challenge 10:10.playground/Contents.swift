import UIKit

func reverseSort(_ strings: [String]) -> [String] {
    return strings.sorted() { $0 > $1 }
}

print(reverseSort(["Bob", "Jill", "Sally"]))
print(reverseSort(["Vern", "Gidget", "Zeb"]))
print(reverseSort(["Bob", "Gidget", "Zeb", "Jill", "Sally", "Vern"]))


// $0 is the first parameter, $1 is the second parameter
// each letter has a number value, so the > tells the .sorted
// function to sort them from Z-A, < would sort them by A-Z
