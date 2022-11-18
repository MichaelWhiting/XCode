import UIKit

func close_compare(a: Int, b: Int, margin: Int?) -> Int {
    guard margin ?? 0 >= abs(a - b) else { return a < b ? -1 : 1 }
    return 0
}

print(close_compare(a: 5, b: 3, margin: nil)) // a > b
print(close_compare(a: 1, b: 3, margin: 1)) // b > a
print(close_compare(a: 1, b: 3, margin: 4)) // margin > distance


