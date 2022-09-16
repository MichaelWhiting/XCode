import UIKit

struct Temperature {
    var celsius: Double
    
    init(celsius: Double) {
        self.celsius = celsius // this initializer is basically storing the celsius value to we can use it for other things in the struct
    }
    
    init(fahrenheit: Double) {
        celsius = (fahrenheit - 32) / 1.8 // made this initializer so we can convert fahrenheit to celsius and have the formula stay here
    }
}

let currentTemp = Temperature(celsius: 18.5)

enum BreadType: String {
    case white, wheat
}

struct Sandwich {
    let bread: BreadType = .white
    let tomato: Bool
    let lettuce: Bool
    
    init(tomato: Bool, lettuce: Bool) {
        self.tomato = tomato
        self.lettuce = lettuce
    }
}

let hamSammy = Sandwich(tomato: true, lettuce: false)
