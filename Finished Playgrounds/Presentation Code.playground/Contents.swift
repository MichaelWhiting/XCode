import UIKit

struct Struct {
    // Code goes here
}


class Class {
    // Code goes here
}


struct Person {
    let name: String // Defining data for the structure to hold
    var age: Int
    var height: Int
    
    func displayInfo() { // Creating a function/method to display the information stored in the struct
        print("Hello, my name is \(name). I am \(age) years old, and I am \(height) inches tall.")
        // ^ Prints out the information in the struct
    }
}

var person1 = Person(name: "John", age: 25, height: 72) // Creates an instance of the Person struct
person1.displayInfo() // Calls the function to run
person1.age += 1 // Changes the persons age to 26


class Shape {
    var name: String // Creates 2 basic variables that all shapes will use
    var color: String
    
    init(name: String, color: String) { // Initializes those two variables
        self.name = name
        self.color = color
    }
}

class Rectangle: Shape { // Inherits the two variables from the Shape base class
    var height: Int // New variables that this subclass can use for its specific shape
    var width: Int
    
    init(name: String, color:String, height: Int, width: Int) { // Initializes those variables for the shape
        self.height = height
        self.width = width
        super.init(name: name, color: color) // Also initializes the base class' variables
    }
    
    func area() -> Int { // Function to calculate the area
        return height * width
    }
}

var rec = Rectangle(name: "Rectangle", color: "Blue", height: 5, width: 3) // Creates an instance of the Rectangle class
print(rec.area())

