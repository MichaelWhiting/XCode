import UIKit

func convertToMillisecond(hours: Int, minutes: Int, seconds: Int) -> Int {
    return (hours * 3600000) + (minutes * 60000) + (seconds * 1000)
}

print(convertToMillisecond(hours: 0, minutes: 1, seconds: 1))

