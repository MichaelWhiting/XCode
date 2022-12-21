import UIKit

func isToday(date: Date) -> Bool {
    return Calendar.current.isDateInToday(date)
}

let formatter = DateFormatter()
formatter.dateFormat = "yyyy/MM/dd"
let someDateTime = formatter.date(from: "2022/12/12")

print(isToday(date: someDateTime!))
