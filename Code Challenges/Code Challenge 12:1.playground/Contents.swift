import UIKit

// Given a string, you have to return a string in which each character (case-sensitive) is repeated once.

// Examples (Input -> Output):
// * "String"      -> "SSttrriinngg"
// * "Hello World" -> "HHeelllloo  WWoorrlldd"
// * "1234!_ "     -> "11223344!!__  "
// Good Luck!

func repeatOnce(_ str: String) -> String {
    var returnString = ""
    
    str.forEach { returnString.append("\($0)\($0)") }
    
    return returnString
}

//    return str.map { "\($0)\($0)" }.joined()

print(repeatOnce("String"))
print(repeatOnce("Hello World"))
print(repeatOnce("1234!_"))


