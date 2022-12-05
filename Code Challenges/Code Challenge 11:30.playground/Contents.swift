import UIKit

func swapFirstLast(_ name: String) -> String {
    return name.split(separator: " ").reversed().joined(separator: " ")
}


print(swapFirstLast("john McClane"))
