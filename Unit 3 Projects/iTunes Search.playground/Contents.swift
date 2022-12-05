import UIKit

extension Data {
    func prettyPrintedJSONString() {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []), let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]), let prettyJsonString = String(data: jsonData, encoding: .utf8) else { print("Failed to read JSON Object.")
            return
        }
        
    }
}

enum StoreItemError: Error, LocalizedError {
    case itemsNotFound
}

struct SearchResponse: Codable {
    let results: [StoreItem]
}

struct StoreItem: Codable {
    var trackName: String
    var artistName: String
    var description: String
    var artworkURL: URL

    enum CodingKeys: String, CodingKey {
        case trackName = "trackName"
        case artistName = "artistName"
        case description = "description"
        case artworkURL = "artworkUrl100"
    }
    
    enum AdditionalKeys: String, CodingKey {
        case longDescription = "longDescription"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        trackName = try values.decode(String.self, forKey: CodingKeys.trackName)
        artistName = try values.decode(String.self, forKey: CodingKeys.artistName)
        artworkURL = try values.decode(URL.self, forKey: CodingKeys.artworkURL)
        
        if let description = try? values.decode(String.self, forKey: CodingKeys.description) {
            self.description = description
        } else {
            let additionalValues = try decoder.container(keyedBy: AdditionalKeys.self)
            description = (try? additionalValues.decode(String.self, forKey: AdditionalKeys.longDescription)) ?? ""
        }
    }
}

func fetchItems(matching quary: [String: String]) async throws -> [StoreItem] {
    var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!
    
    urlComponents.queryItems = quary.map { URLQueryItem(name: $0.key , value: $0.value) }

    let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw StoreItemError.itemsNotFound
    }
    
    data.prettyPrintedJSONString()
    
    let decoder = JSONDecoder()
    let searchResponse = try decoder.decode(SearchResponse.self, from: data)
    
    return searchResponse.results
}

let queryItems = [
    "term": "Apple",
    "media": "ebook",
    "attribute": "authorTerm",
    "lang": "en_us",
    "limit": "10"
]

Task {
    do {
        let storeItems = try await fetchItems(matching: queryItems)
        storeItems.forEach { item in
            print("""
                Book Name: \(item.trackName)
                Author: \(item.artistName)
                Description: \(item.description)
                Artwork URL: \(item.artworkURL)
            """)
        }
    } catch {
        print(error)
    }
}








let baseURL = "https://itunes.apple.com/search"

func makeSearchURL(queryItems: [String: String]) -> URL {
    var components = URLComponents(string: baseURL)!
    components.queryItems = queryItems.map { URLQueryItem(name: $0.key, value: $0.value) }
    return components.url!
}

let searchURL = makeSearchURL(queryItems: queryItems)


//Task {
//    let (data, response) = try await URLSession.shared.data(from: searchURL)
//
//    if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
//        data.prettyPrintedJSONString()
//    }
//}
//
//
//Task {
//    let (data, response) = try await URLSession.shared.data(from: searchURL)
//
//    if let httpResponse = response as? HTTPURLResponse,
//       httpResponse.statusCode == 200,
//       let string = String(data: data, encoding: .utf8) {
//        print(string)
//    }
//}


//MARK: Example without a function
//var components = URLComponents(string: baseURL)!
//components.queryItems = [
//    "term": "swift",
//    "media": "music",
//    "country": "US",
//    "limit": "2"
//].map { URLQueryItem(name: $0.key, value: $0.value) }
//
//let searchURL = components.url!


//MARK: Example of a function version
//func searchURL(queryItems: [String: String]) -> URL {
//    var components = URLComponents(string: "https://itunes.apple.com/search")!
//    components.queryItems = queryItems.map { URLQueryItem(name: $0.key, value: $0.value) }
//    return components.url! // dangerous, but quick and dirty for this example
//}
//
//let queryItems = [
//    "term": "swift",
//    "media": "music",
//    "country": "US",
//    "limit": "2"
//]
//let searchURL = searchURL(queryItems: queryItems)
