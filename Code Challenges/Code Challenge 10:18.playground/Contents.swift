import UIKit

func countSentences(str: String) -> Int {
    var amount = 0
    var previous = ""
    for char in str {
//        if previous == "." && Int(String(char)) != nil || char == "." && Int(String(previous)) != nil  {
//            previous = String(char)
//            continue
//        }
        if char == "." || char == "?" || char == "!" {
            amount += previous != String(char) ? 1 : 0
        }
        previous = String(char)
    }
    
    return amount
}

print(countSentences(str: "Hello! This is a sentence. Is there 3 sentences?"))
print(countSentences(str: "Hello! This is a sentence... Is there 3 sentences?"))
