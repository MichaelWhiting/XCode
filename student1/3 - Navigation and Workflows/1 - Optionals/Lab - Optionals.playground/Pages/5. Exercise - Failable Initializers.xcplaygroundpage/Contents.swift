/*:
## Exercise - Failable Initializers

 Create a `Computer` struct with two properties, `ram` and `yearManufactured`, where both parameters are of type `Int`. Create a failable initializer that will only create an instance of `Computer` if `ram` is greater than 0, and if `yearManufactured` is greater than 1970, and less than 2020.
 */
struct Computer {
    var ram: Int
    var yearManufactured: Int
    
    init?(ram: Int, yearManufactured: Int) {
        if !(1970...2020).contains(yearManufactured) && ram <= 0 {
            return nil
        } else {
            self.ram = ram
            self.yearManufactured = yearManufactured
        }
    }
}

//:  Create two instances of `Computer?` using the failable initializer. One instance should use values that will have a value within the optional, and the other should result in `nil`. Use if-let syntax to unwrap each of the `Computer?` objects and print the `ram` and `yearManufactured` if the optional contains a value.
let computer1 = Computer(ram: 16, yearManufactured: 1997)

if let comp1Year = computer1?.yearManufactured, let comp1Ram = computer1?.ram {
    print("\(comp1Year) \(comp1Ram)")
} else {
    print("Instance contains a nil value")
}

if let computer2 = Computer(ram: 0, yearManufactured: 2022) { // could also do this
    print("\(computer2.ram) \(computer2.yearManufactured)")
} else {
    print("Instance contains a nil value")
}
/*:
[Previous](@previous)  |  page 5 of 6  |  [Next: App Exercise - Workout or Nil](@next)
 */
