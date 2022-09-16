import UIKit

func findDist(_ x1: Double,_ y1: Double,_ x2: Double,_ y2: Double) -> Double {
    return sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2))
}

print(findDist(-2, 4, 8, -8))
