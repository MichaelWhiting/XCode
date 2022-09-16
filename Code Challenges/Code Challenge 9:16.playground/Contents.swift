import UIKit

let gradesArr = [60,90,52]

// used an array
func getGrade(grades: [Int]) -> String {
    var average = grades.reduce(0, +)
    average /= grades.count
    
    switch average {
        case 90...100:
            return "A"
        case 80...89:
            return "B"
        case 70...79:
            return "C"
        case 60...69:
            return "D"
        default:
            return "F"
    }
}

print(getGrade(grades: gradesArr))


// with only 3 scores
func getGrade(score1: Int, score2: Int, score3: Int) -> String {
    let average = (score1 + score2 + score3) / 3
    
    switch average {
        case 90...100:
            return "A"
        case 80...89:
            return "B"
        case 70...79:
            return "C"
        case 60...69:
            return "D"
        default:
            return "F"
    }
}

print(getGrade(grades: gradesArr))
