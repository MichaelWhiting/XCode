import UIKit

func isDigit(_ str: String) -> Bool {
    return Int(str) != nil && str.count == 1
}

print(isDigit("0f9"))
print(isDigit("10"))
print(isDigit("9"))

