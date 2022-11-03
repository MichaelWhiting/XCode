import UIKit
// Observe the photo of the ball clock:
// https://tinyurl.com/3pacct63
// Write a function that accepts 3 ball counts (one for each row) and returns a description of the time represented by those counts
// e.g. 1, 0, 0 would return something like: "The current time is: 1:00" but
// 2, 1, 2, would return something like: "The current time is 2:07"

func timeString(from ballCounts: (hr: Int, fiveMin: Int, min: Int)) -> String {
    var minTime = ballCounts.min + ballCounts.fiveMin * 5
    var hourTime = ballCounts.hr
    
    if minTime >= 60 {
        hourTime += 1
        minTime -= 60
    }
    
    return minTime < 10 ? "\(hourTime):0\(minTime)" : "\(hourTime):\(minTime)"
}


print(timeString(from: (hr: 1, fiveMin: 5, min: 2))) // should print 1:27
print(timeString(from: (hr: 2, fiveMin: 1, min: 4))) // should print 2:09
