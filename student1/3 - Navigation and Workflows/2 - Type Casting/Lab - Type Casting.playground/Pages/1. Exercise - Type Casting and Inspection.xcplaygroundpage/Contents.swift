/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
let data: [Any] = [1,2,4,"String", "Michael", false, true, false, 2.1, 4.2, 3.1]

//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for item in data {
    if let integer = item as? Int {
        print("The integer has a value of: \(integer)")
    } else if let string = item as? String {
        print("The string has a value of: \(string)")
    } else if let bool = item as? Bool {
        print("The bool has a value of: \(bool)")
    } else if let double = item as? Double {
        print("The double has a value of: \(double)")
    }
}

//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
let dictionary: [String: Any] = ["Name": "Michael", "Age": 17, "HasGlasses": true, "ExactAge": 17.99]
for (key, value) in dictionary {
    if let integer = value as? Int {
        print("\(key) \(integer)")
    } else if let string = value as? String {
        print("\(key) \(string)")
    } else if let bool = value as? Bool {
        print("\(key) \(bool)")
    } else if let double = value as? Double {
        print("\(key) \(double)")
    }
}
//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total: Double = 0
for (_, value) in dictionary {
    if let integer = value as? Int {
        total += Double(integer)
    } else if let _ = value as? String {
        total += 1
    } else if let bool = value as? Bool {
        if bool == true {
            total += 2
        } else {
            total -= 3
        }
    } else if let double = value as? Double {
        total += double
    }
}

print(total)

//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2: Double = 0
for (_, value) in dictionary {
    if let integer = value as? Int {
        total2 += Double(integer)
    } else if let string = value as? String {
        if let intString = Double(string) {
            total2 += intString
        } else {
            continue
        }
    } else if let _ = value as? Bool {
        continue
    } else if let double = value as? Double {
        total2 += double
    }
}

print(total2)

/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
