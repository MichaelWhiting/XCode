import UIKit

enum phoneNumError: Error {
    case notCorrectLength
    case notNumbers
}

func phoneAPI(phoneNum: String) throws -> String {
    guard Int(phoneNum) != nil else { throw phoneNumError.notNumbers }
    var formatted = phoneNum
    
    if formatted.count == 10 {
        let firstDash = formatted.index(formatted.startIndex, offsetBy: 3)
        let secondDash = formatted.index(formatted.startIndex, offsetBy: 7)
        formatted.insert("-", at: firstDash)
        formatted.insert("-", at: secondDash)
    } else {
        throw phoneNumError.notCorrectLength
    }
    
    return formatted
}

do {
    print(try phoneAPI(phoneNum: "1234567890"))
    print(try phoneAPI(phoneNum: "12345679i0"))
} catch phoneNumError.notCorrectLength {
    print("Error: Number is too short or too long")
} catch phoneNumError.notNumbers {
    print("Error: The input contains something that isn't a number")
}
