import UIKit

// "Point reflection" or "point symmetry" is a basic concept in geometry where a given point, P, at a given position relative to a mid-point, Q has a corresponding point, P1, which is the same distance from Q but in the opposite direction.

// Task
// Given two points P and Q, output the symmetric point of point P about Q. Each argument is of the type Point. Output should be in the same format, giving the X and Y coordinates of point P1. You do not have to validate the input.

// Examples
// (0, 0) & (1, 1) => (2, 2)
// (2, 6) & (-2, -6) => (-6, -18)

struct Point {
    var x: Int
    var y: Int
}

func symmetricPoint(p: Point, q: Point) -> Point {
    return Point(x: q.x + q.x - p.x, y: q.y + q.y - p.y)
}

print(symmetricPoint(p: Point(x: 0, y: 0), q: Point(x: 1, y: 1)))
print(symmetricPoint(p: Point(x: 2, y: 6), q: Point(x: -2, y: -6)))
print(symmetricPoint(p: Point(x: -2, y: -6), q: Point(x: 2, y: 6)))
print(symmetricPoint(p: Point(x: 2, y: 2), q: Point(x: 0, y: 0)))
