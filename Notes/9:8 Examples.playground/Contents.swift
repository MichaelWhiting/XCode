import UIKit

class Pet {
    var type = ""
    var numberOfLegs = 0
    var numberofWings = 0
    
    func makeNoise() {
        //override this
    }
}

class Dog: Pet {
    override init() {
        super.init()
        self.type = "dog"
        self.numberOfLegs = 4
        self.numberofWings = 0
    }
    
    override func makeNoise() {
        print("woof")
    }
    
    func walk() {
        
    }
}

class Cat: Pet {
    override init() {
        super.init()
        self.type = "cat"
        self.numberOfLegs = 4
        self.numberofWings = 0
    }
    
    override func makeNoise() {
        print("meow")
    }
    
    func jumpOverMoon() {
        
    }
}

class Bird: Pet {
    override init() {
        super.init()
        self.type = "bird"
        self.numberOfLegs = 2
        self.numberofWings = 2
    }
    
    override func makeNoise() {
        print("squawk")
    }
    
    func payTaxes() {
        
    }
}

let pets: [Pet] = [Dog(), Bird(), Cat()]

for pet in pets {
    if let dog = pet as? Dog {
        print("Its a dog")
        dog.walk()
    } else if let cat = pet as? Cat {
        print("Its a cat")
        cat.jumpOverMoon()
    } else if let bird = pet as? Bird {
        print("Its a bird")
        bird.payTaxes()
    }
}
