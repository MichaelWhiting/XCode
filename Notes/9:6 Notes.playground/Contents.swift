import UIKit

let publicationYear: Int? = nil // ? makes the Int an optional

if publicationYear != nil { // if statement is making sure that the optional has a value
    let actualYear = publicationYear! // ! is unwrapping the optional and "promising" the computer a value.
    print(actualYear)
}

// Optional Binding
if let unwrappedPublicationYear = publicationYear { // checking if publicationYear has a value
    print(unwrappedPublicationYear) // it will print this if it has a value
} else {
    print(publicationYear) // it will print this if it does NOT have a value
}

if let publicationYear = publicationYear { // use the same name for them so it makes sense to the coder
    print(publicationYear)
} else {
    print(publicationYear)
}


// Function Optional
func printFullName(firstName: String, middleName: String?, lastName: String) {
    if let middleName = middleName {
        print("Full name is \(firstName) \(middleName) \(lastName)")
    } else {
        print("Full name is \(firstName) \(lastName)")

    }
}

printFullName(firstName: "Michael", middleName: nil, lastName: "Whiting")
printFullName(firstName: "Michael", middleName: "Brent", lastName: "Whiting")

// Failable Initializer

struct Toddler {
    var name: String
    var monthsOld: Int
    
    init?(name: String, monthsOld: Int) { // This question mark is going to make it return an optional
        if monthsOld < 12 || monthsOld > 36 {
            return nil
        } else {
            self.name = name
            self.monthsOld = monthsOld
        }
    }
}






