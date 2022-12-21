import UIKit

// Description:
// Remove an exclamation mark from the end of a string.

// Examples
// remove("Hi!") === "Hi"
// remove("Hi!!!") === "Hi!!"
// remove("!Hi") === "!Hi"
// remove("!Hi!") === "!Hi"
// remove("Hi! Hi!") === "Hi! Hi"
// remove("Hi") === "Hi"

func removeExclamation(str: String) -> String {
    return str.last == "!" ? "\(str.dropLast())" : str
}

print(removeExclamation(str: "Hi!")) // Hi
print(removeExclamation(str: "Hi!!!")) // Hi!!
print(removeExclamation(str: "!Hi")) // !Hi
print(removeExclamation(str: "Hi! Hi!")) // Hi! Hi
