import UIKit

func isASCIIVowel(arr: [Int]) -> [Int: Int] {
    var returnDictionary = [Int: Int]()
    let vowels = "AEIOU"
    for (i,num) in arr.enumerated() {
        let unicodeNum = Character(UnicodeScalar(num)!)
        for vowel in vowels {
            if unicodeNum == vowel || unicodeNum == Character(vowel.lowercased()) {
                returnDictionary[i] = num
            }
        }
    }
    
    return returnDictionary
}

print(isASCIIVowel(arr: [97,66,79, 105, 107])) // a, B, O, i, k

func checkVowelsFromInts(arr: [Int]) -> [Character: [Int]] {
    var result: [Character: [Int]] = ["a": [],"e": [],"i": [],"o": [],"u": []]
    
    for (i, num) in arr.enumerated() {
        switch Character(UnicodeScalar(num) ?? "z") {
            case "a", "e", "i", "o", "u":
            return[Character(UnicodeScalar(num)!)].append(i)
            default:
                result
        }
    }
    
    return result
}
