import UIKit

func isWilsonPrime(p: Int) -> Bool {
    guard p > 0 else { return false }
    let math = Double((factorial((p - 1)) + 1)) / Double((p * p))
    return floor(math) == math ? true : false
}

func factorial(_ num: Int) -> Int {
    guard num > 0 else { return 1 }
    return num * factorial(num - 1)
}

print(isWilsonPrime(p: 0))
print(isWilsonPrime(p: 4))
print(isWilsonPrime(p: 5))
print(isWilsonPrime(p: 6))
print(isWilsonPrime(p: 13))
