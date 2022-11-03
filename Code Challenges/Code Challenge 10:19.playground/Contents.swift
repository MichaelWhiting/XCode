import UIKit

func convertToDate(_ dateString: String) -> Date? {
    let dateFormatter = DateFormatter()
    
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    return dateFormatter.date(from: dateString)
}

convertToDate("1999-07-12")
