import UIKit

struct Person {
    var name: String
}

let names = ["Bob", "Stan", "Julie", "Beth"]


let people1 = names.map { Person(name: $0) }

let people2 = names.map { name in
    return Person(name: name)
}

//explicitly making it from string -> Person
let people3 = names.map { (name: String) -> Person in
    return Person(name: name)
}


// MARK: Reduce

struct Family {
    var familyName: String
    var members: [Person]
}

let family = Family(familyName: "Johnsons", members: [])

let actualFamily = names.reduce(family) { currentFamily, name in
    var currentFamily = currentFamily
    let person = Person(name: name)
    currentFamily.members.append(person)
    return currentFamily
}

print(actualFamily)

func sortNames(first: String, second:String) -> Bool {
    return first < second
}

let sortedNames = names.sorted(by: sortNames)



