import UIKit
import Darwin

struct Person {
    let name: String
    var age: Double

    mutating func birthdayHappened() { // instead of returning a value, its changing the value
        self.age += 1
    }
    
    init(firstName:String, lastName: String, age: Double) {
        self.name = firstName + lastName
        self.age = age
    }
}

var jordan = Person(firstName: "Jordan", lastName: "Hansen", age: 21.5)
print(jordan.age)
jordan.birthdayHappened()
print(jordan.age)

struct Firearm {
    let barrelLength: Double
    let ammoType: String
    let lengthOfGun: Double
    
    init(barrelLength: Double, ammoType: String, lengthOfPull: Double) {
        self.barrelLength = barrelLength
        self.ammoType = ammoType
        self.lengthOfGun = lengthOfPull + barrelLength
    }
}
    

let shotgun = Firearm(barrelLength: 28.00, ammoType: "12 Gauge", lengthOfPull: 13)
print(shotgun.lengthOfGun)

struct House {
    let squareFootage: Double
    let houseType: String
    let stories: Int
    
    init(squareFootage: Double, houseType: String, stories: Int) {
        self.squareFootage = squareFootage
        self.houseType = houseType
        self.stories = stories
    }
}

let myHouse = House(squareFootage: 2000, houseType: "Appartment", stories: 2)

print(myHouse.stories)

struct Size {
    var width: Double
    var height: Double
    
    func area() -> Double {
        width * height
    }
}

let squareSize = Size(width: 5, height: 3)
print(squareSize.area())
