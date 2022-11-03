import UIKit

func primeNumber(num: Int) -> Bool {
    guard num > 1 else { return false }
    return !(2..<num).contains { num % $0 == 0 }
}

print(primeNumber(num: 1))
print(primeNumber(num: 2))
print(primeNumber(num: 3))
print(primeNumber(num: 4))
print(primeNumber(num: 5))
