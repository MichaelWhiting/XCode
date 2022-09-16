import UIKit

struct Rectangle {
    var sideA: Int
    var sideB: Int
    
    func area() -> Int {
        return (sideA * sideB)
    }
    
    func perimeter() -> Int {
        return (sideA * 2) + (sideB * 2)
    }
    
    mutating func scale(by scaleVal: Int) {
        self.sideA *= scaleVal
        self.sideB *= scaleVal
    }
}

var shape = Rectangle(sideA: 5, sideB: 3)
print(shape.area())
print(shape.perimeter())

shape.scale(by: 2)

print(shape.area())
print(shape.perimeter())
