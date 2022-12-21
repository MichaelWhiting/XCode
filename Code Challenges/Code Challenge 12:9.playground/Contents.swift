import UIKit

// Given 2 strings, a and b, return a string of the form short+long+short, with the shorter string on the outside and the longer string on the inside. The strings will not be the same length, but they may be empty ( zero length ).

// For example: (Input1, Input2) --> output

// ("1", "22") --> "1221"
// ("22", "1") --> "1221"

func shortLongShort(_ a: String, _ b: String) -> String {
    return a.count >= b.count ? b + a + b : a + b + a
}

print(shortLongShort("1", "22"))
print(shortLongShort("22", "1"))
print(shortLongShort("111", "5000"))
