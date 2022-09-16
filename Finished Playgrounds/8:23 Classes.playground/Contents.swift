import UIKit

class Person {
    let name: String
    
    init(name:String) {
        self.name = name
    }
}

class Student: Person {
    var favoriteSubject: String = ""
    
    init(name: String, favoriteSubject: String) {
        self.favoriteSubject = favoriteSubject
        super.init(name: name) // have to do the super init after everything else, because subclasses must initialize first
    }
}
