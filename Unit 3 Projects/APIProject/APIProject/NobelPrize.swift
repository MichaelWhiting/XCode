//
//  NobelPrize.swift
//  APIProject
//
//  Created by Michael Whiting on 12/5/22.
//

import Foundation

struct SearchResults: Codable {
    let results: [NobelPrize]
    
    enum CodingKeys: String, CodingKey {
        case results = "prizes"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode([NobelPrize].self, forKey: .results)
    }
}

struct NobelPrize: Codable {
    var year: String
    var category: String
    var laureates: [PrizeWinner]
    var isOpened: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case year = "year"
        case category = "category"
        case laureates = "laureates"
    }
    
    init(isOpened: Bool = false, from decoder: Decoder) throws {
        self.isOpened = isOpened
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.year = try container.decode(String.self, forKey: .year)
        self.category = try container.decode(String.self, forKey: .category)
        self.laureates = try container.decode([PrizeWinner].self, forKey: .laureates)
    }
}
