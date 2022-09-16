import UIKit

class Person {
    let name: String
    var age: Int
    var weight: Double
    var favoriteColor: String
    
    init(name: String, age: Int, weight: Double, favoriteColor: String) {
        self.name = name
        self.age = age
        self.weight = weight
        self.favoriteColor = favoriteColor
    }
}

class Student: Person {
    var currentClass: String
    var grade: Double
    var gpa: Double
    
    init(name: String, age: Int, weight: Double, favoriteColor: String, currentClass: String, grade: Double, gpa: Double) {
        self.currentClass = currentClass
        self.grade = grade
        self.gpa = gpa
        super.init(name: name, age: age, weight: weight, favoriteColor: favoriteColor)
    }
}

var person1 = Person(name: "John", age: 25, weight: 200, favoriteColor: "Blue")
print(person1.age)

var student1 = Student(name: "Jerry", age: 19, weight: 175, favoriteColor: "Red", currentClass: "Math", grade: 89, gpa: 3.75)
print(student1.age)
