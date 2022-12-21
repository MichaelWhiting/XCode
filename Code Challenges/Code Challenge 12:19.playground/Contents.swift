import UIKit

// You are given the length and width of a 4-sided polygon. The polygon can either be a rectangle or a square.
// If it is a square, return its area. If it is a rectangle, return its perimeter.

func squareOrRectangle(length: Double, width: Double) -> Double {
    return length == width ? length * width : 2 * length + 2 * width
}

print(squareOrRectangle(length: 2, width: 2))
print(squareOrRectangle(length: 4, width: 2))
print(squareOrRectangle(length: 4, width: 4))

