import UIKit

// Is the string uppercase?
// Task
// Create a method to see whether the string is ALL CAPS.

// Examples (input -> output)
// "c" -> False
// "C" -> True
// "hello I AM DONALD" -> False
// "HELLO I AM DONALD" -> True
// "ACSKLDFJSgSKLDFJSKLDFJ" -> False
// "ACSKLDFJSGSKLDFJSKLDFJ" -> True
// A string is said to be in ALL CAPS whenever it does not contain any lowercase letter so any string containing no letters at all is trivially considered to be in ALL CAPS.

func isStrCaps(str: String) -> Bool {
    return str == str.uppercased()
}

print(isStrCaps(str: "1"))
print(isStrCaps(str: "ACSKLDFJSgSKLDFJSKLDFJ"))
print(isStrCaps(str: "ACSKLDFJSGSKLDFJSKLDFJ"))
