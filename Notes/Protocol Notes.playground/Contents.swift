import UIKit

// Protocols - define a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality.
// when you adopt a protocol, you must implement all required methods


// -TYPES OF PROTOCOLS-

// CustomStringConvertible: Must have a description var in the class - make class a subclass of CustomStringConvertable

// Equatable: checking if two things are the same
// ex:  static func == (lhs: Employee, rhs: Employee) -> Bool {
//        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
//      }

// Comparable: return something if they are different
// ex:  static func < (lhs: Employee, rhs: Employee) -> Bool {
//          return lhs.lastName < rhs.lsatName
//      }

// Codable: means that it can encodable and decodable (convert to dif type, the convert back)

// { get } is computable, can't mutate it

protocol FullyNamed {
    var fullName: String { get }
    
    func sayFullName()
}

struct Person: FullyNamed {
    var firstName: String
    var secondName: String
    var fullName: String {
        return "\(firstName) \(secondName)"
    }
    
    func sayFullName() {
        print(fullName)
    }
}

let person1 = Person(firstName: "Michael", secondName: "Whiting")
person1.sayFullName()
