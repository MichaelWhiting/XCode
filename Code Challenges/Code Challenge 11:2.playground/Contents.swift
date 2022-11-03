import UIKit

func compareScores(testScores: [Int], score: Int) -> Bool {
    let average = (testScores.reduce(0, +) + score) / (testScores.count + 1)
    return score > average
}

print(compareScores(testScores: [90,80,70], score: 95))
print(compareScores(testScores: [90,80,70,80], score: 75))
