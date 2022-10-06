import UIKit

var add:(Int, Int, String) -> String = {
    return String($0) + String($1) + $2
}

print(add(1,2,"words"))


