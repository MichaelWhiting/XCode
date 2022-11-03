import UIKit

extension String {
    func isPalindrome() -> Bool {
        let original = self.lowercased().filter { !$0.isWhitespace } // $0 is referencing the string, so it will
        let reversed = String(self.reversed()).lowercased().filter { !$0.isWhitespace } // return a string with all
        return original == reversed                                                     // the spaces removed
    }
}

let strings = ["racecar", "daD", "golf", "jury", "mom"]
let phrases = ["Too bad I hid a boot", "Taco Cat", "Totally not a palindrome"]

for string in strings {
    print("\(string) - \(string.isPalindrome())")
}

for phrase in phrases {
    print("\(phrase) - \(phrase.isPalindrome())")
}



