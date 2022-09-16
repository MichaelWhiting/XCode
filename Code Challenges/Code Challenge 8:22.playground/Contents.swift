import UIKit

func findArea(radius: Int) -> Double { // Name of the function and the Int parameter, returns a Double.
    return 3.14 * (Double(radius * radius)) // Changes the Ints to Doubles and then calculates the area, and returns it.
}

print(findArea(radius: 19)) // Prints the area of the circle, with the provided radius.
