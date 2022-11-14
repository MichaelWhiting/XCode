import UIKit

func toThePowerOf(n: Int) -> [Int] {
    var arr = [Int]()
    
    for num in 0...n {
        let num = Int(pow(2, Double(num)))
        arr.append(num)
    }
    
    return arr
}

print(toThePowerOf(n:2))
