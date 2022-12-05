//
//  StoreItemController.swift
//  iTunesSearchLab
//
//  Created by Michael Whiting on 12/1/22.
//

import Foundation

class StoreItemController {
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
}
