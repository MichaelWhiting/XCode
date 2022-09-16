import UIKit

struct Person {
    let name: String
    var age: Int
    var height: Int
    var weight: Double
    
    func greeting() {
        print("Hello, my name is \(name), and I am \(age) years old.")
    }
    
    mutating func birthday() {
        age+=1
    }
}






