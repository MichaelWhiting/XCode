import UIKit

func calculateTriArea(a: Double, b: Double, c: Double) -> Double {
    let s = (a + b + c) / 2
    let area = sqrt(s * (s - a) * (s - b) * (s - c))
    
    if let number = Double(String(format: "%.2f", area)) {
        return number
    }
    return 0.0
}

print(calculateTriArea(a: 5.25, b: 3.215, c: 8))



func roundDecF(num: Float, significantDig: Int) -> Float {
    let power = powf(10, Float(significantDig))
    return roundf(num * power) / power
}

func calculateTriArea(a: Float, b: Float, c: Float) -> Float {
    let s = (a + b + c) / 2
    let area = sqrtf(s * (s - a) * (s - b) * (s - c))
    
    if let number = Float(String(format: "%.2f", area)) {
        return number
    }
    return 0.0
}

