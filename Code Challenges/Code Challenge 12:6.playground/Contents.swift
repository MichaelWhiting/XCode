import UIKit

func removeNumbers(_ str: String) -> String {
    return str.filter { !$0.isNumber }
}

print(removeNumbers("! !"))
print(removeNumbers("123456789"))
print(removeNumbers("This looks5 grea8t!"))
