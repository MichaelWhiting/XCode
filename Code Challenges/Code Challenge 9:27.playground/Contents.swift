import UIKit


// takes Ints
let scores1: [Int] = [90,80,62,50,75]

func calcAverage(scores: [Int]) -> Int {
    let average = scores.reduce(0,+) / scores.count
    return average
}

print(calcAverage(scores: scores1))


// takes Doubles
let scores2: [Double] = [90.23,80.5,62.49,52,75.9]

func calcAverage2(scores: [Double]) -> Int {
    let average = scores.reduce(0,+) / Double(scores.count)
    return Int(average)
}

print(calcAverage2(scores: scores2))
