/*:
## Exercise - Adopt Protocols: CustomStringConvertible, Equatable, and Comparable
 
 Create a `Human` class with two properties: `name` of type `String`, and `age` of type `Int`. You'll need to create a memberwise initializer for the class. Initialize two `Human` instances.
 */

import Foundation
class Human: CustomStringConvertible, Equatable, Comparable, Codable {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    var description: String {
        return "Human: name: \(name), age: \(age)"
    }
    
    static func == (first: Human, second: Human) -> Bool {
        return first.name == second.name && first.age == second.age
    }
    
    static func < (first: Human, second: Human) -> Bool {
        return first.age < second.age
    }
}

let human1 = Human(name: "Michael", age: 18)
let human2 = Human(name: "John", age: 25)
//:  Make the `Human` class adopt the `CustomStringConvertible` protocol. Print both of your previously initialized `Human` objects.
print(human1)
print(human2)

//:  Make the `Human` class adopt the `Equatable` protocol. Two instances of `Human` should be considered equal if their names and ages are identical to one another. Print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are equal to eachother (using `==`). Then print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are not equal to eachother (using `!=`).
if human1 == human2 {
    print("Are Equal")
} else {
    print("Not Equal")
}

//:  Make the `Human` class adopt the `Comparable` protocol. Sorting should be based on age. Create another three instances of a `Human`, then create an array called `people` of type `[Human]` with all of the `Human` objects that you have initialized. Create a new array called `sortedPeople` of type `[Human]` that is the `people` array sorted by age.
let human3 = Human(name: "Jackson", age: 29)
let human4 = Human(name: "Jake", age: 20)
let human5 = Human(name: "Matthew", age: 40)
let people = [human1, human2, human3, human4, human5]
let sortedPeople = people.sorted(by: <)

//:  Make the `Human` class adopt the `Codable` protocol. Create a `JSONEncoder` and use it to encode as data one of the `Human` objects you have initialized. Then use that `Data` object to initialize a `String` representing the data that is stored, and print it to the console.
let jsonEncoder = JSONEncoder()
if let jsonData = try? jsonEncoder.encode(human1),
    let jsonString = String(data: jsonData, encoding: .utf8) {
        print(jsonString)
    }

/*:
page 1 of 5  |  [Next: App Exercise - Printable Workouts](@next)
 */
