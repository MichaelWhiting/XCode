import UIKit

func distance(pillars: Int, distance: Int, width: Int) -> Int {
    return pillars * distance * 100 + width * (pillars - 2)
}

print(distance(pillars: 3, distance: 10, width: 10))
print(distance(pillars: 3, distance: 30, width: 50))
print(distance(pillars: 3, distance: 3, width: 100))

