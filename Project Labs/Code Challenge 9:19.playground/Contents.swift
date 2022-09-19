import UIKit


func calcCentury(year: Int) -> Int {
    let hasRemainder = year % 100
    return hasRemainder > 0 ? year / 100 + 1 : year / 100
}

print(calcCentury(year: 1601))
print(calcCentury(year: 2000))
print(calcCentury(year: 1705))

