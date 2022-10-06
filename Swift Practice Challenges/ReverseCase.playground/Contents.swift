import UIKit

func reverseCase(_ str: String) -> String {
    var newStr = ""
    for char in str {
        if char.isUppercase {
            newStr.append(char.lowercased())
        } else {
            newStr.append(char.uppercased())
        }
    }
    
    return newStr
}

print(reverseCase("hAPPY bIRTHDAY!"))
