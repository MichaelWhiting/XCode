import UIKit

func factorial(_ num: Int) -> Int {
    guard num > 0 else { return 1 }
    return num * factorial(num - 1)
}

print(factorial(0))
print(factorial(1))
print(factorial(4))
