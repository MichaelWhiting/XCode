//
//  StoreItem.swift
//  iTunesSearchLab
//
//  Created by Michael Whiting on 12/1/22.
//

import Foundation

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
