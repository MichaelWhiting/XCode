import UIKit

func removeSpaces(str: String) -> String {
    return String(str.filter { $0 != " " })
}

print(removeSpaces(str: "This will have no spaces"))

// $0 is a referencing each char in the string, it creates a new string filtered by the boolean inside the {}
