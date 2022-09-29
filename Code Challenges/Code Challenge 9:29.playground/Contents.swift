import UIKit

func floatToDollars(num: Double) -> String {
    return String(format: "$%.2f", num)
}

print(floatToDollars(num: 39.99))
print(floatToDollars(num: 3.1))
print(floatToDollars(num: 3))
