import UIKit

func isMatch(str: String, p: String) -> Bool {
    var p2 = p
    if p2.contains("*") {
        return true
    } else if p.contains("?") {
        for letter in str {
            if letter == p2.first || p2.first == "?" {
                p2.removeFirst()
                continue
            } else {
                return false
            }
        }
        return true
    } else if str == p {
        return true
    }
    return false
}


print(isMatch(str: "aa", p: "a"))
