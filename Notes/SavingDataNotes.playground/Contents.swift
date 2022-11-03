import UIKit
import Foundation

// save data to the phone:
// MARK: write to a file: create new file or existing one) save dtat to that file,  Code Data -> JSON.
// MARK: Core Data: iOS-specific saving mechanism integrated into Xcode. A bit fancy.
// MARK: UserDefaults: Meant for smaller bits of data. Things like color theme preference, things a user edits in settings type UI.
// JSON: dictionary in string format

// { "People": [
//    { "Name" : "Ben"
//    "age": 30
//    },
//    {"Name: "Josh"
//    "age": 23
//    }
//   ]
//

// Encodable: Data Object -> JSON
// Decodable: Json -> Data Object
// Codeable: is both

struct BallCount: Codable {
    var hr: Int
    var fiveMin: Int
    var min: Int
    
//    var type: MaterialType
}

//enum MaterialType: Codable {
//    case metal
//    case plastic
//}
// MARK: Encoding an object: (Swift Object -> JSON)
let currentballCount = BallCount(hr: 8, fiveMin: 8, min: 0)
// 1. Convert your date to JSON
// 1.1 Create some sort of Encoder (JSON Encoder)
let encoder = JSONEncoder()
// 1.2 Use the encoder to encode your object
//do {
//    let dataObject = try encoder.encode(currentballCount)
//  try? returns nil when an error is thrown
//} catch {
//    print(error)
//}
let dataObject = try! encoder.encode(currentballCount)
// 2. Save data to a file
// 2.1 Documents Directory
let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
// /User/documents/userDomain/BallCountData.json
// 2.2 Get the URL to the file that we'll save to:
let saveFileURL = documentsDirectory.appendingPathComponent("BallCountData").appendingPathComponent("json")
//2.3 Save data to file URL
do {
    try dataObject.write(to: saveFileURL)
} catch {
    print(error)
}
// MARK: Decoding an object: (JSON -> Swift Object)
// 1. Get the file URL to read from:

// 1.2 get data from file
let data = try Data(contentsOf: saveFileURL)
// 2. Decode our object
let newBallCount = try! JSONDecoder().decode(BallCount.self, from: data)
// let newBallCount : BallCount'

// BallCount Was Created From A File




