import UIKit

func replace(word: String, range: String) -> String {
    let abc = ["a","b","c","d","e","f","g","h","i","j","k","l","m",
               "n","o","p","q","r","s","t","u","v","w","x","y","z"]
    guard word != "" else { return "" }
    guard let rangeBottom = range.first else { return "" }
    guard let rangeTop = range.last else { return "" }
    var newWord = ""
    
    for char in word {
        for (i,letter) in abc.enumerated() {
            guard let rangeBottomI = abc.firstIndex(of: String(rangeBottom)) else { return "" }
            guard let rangeTopI = abc.firstIndex(of: String(rangeTop)) else { return "" }
        
            if String(char) == letter {
                print("")
                if (rangeBottomI...rangeTopI).contains(i) {
                    newWord.append("#")
                } else {
                    newWord.append(char)
                }
            }
        }
    }
    
    return newWord
}

print(replace(word: "word", range: "a-e"))
