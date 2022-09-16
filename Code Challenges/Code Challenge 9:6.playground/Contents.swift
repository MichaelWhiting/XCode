import UIKit

func stringy(size: Int) -> String {
    var newString = ""
    var sizeVal = size
    var alternate = true
    while sizeVal > 0 {
        if alternate {
            newString += "1"
        } else {
            newString += "0"
        }
        alternate = !alternate
        sizeVal -= 1
    }
    return newString
}

print(stringy(size: 12))

func stringyImproved(size: Int) -> String {
    var newString = ""
    var alternate = true
    for _ in 1..<size {
        newString += alternate ? "1" : "0"
        alternate.toggle()
    }
    return newString
}
