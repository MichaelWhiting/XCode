import UIKit

func binaryToDecimal(_ binary: String) -> Int {
    let binaryArr = Array(binary)
    var total: Int = 0
    
    for (i,num) in binaryArr.reversed().enumerated() {
        if num == "0" {
            total += 0
        } else {
            total += Int(pow(2, Double(i)))
        }
    }
    
    return total
}

print(binaryToDecimal("101101"))

