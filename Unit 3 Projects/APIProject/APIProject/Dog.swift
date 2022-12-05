//
//  Dog.swift
//  APIProject
//
//  Created by Michael Whiting on 12/2/22.
//

import Foundation

enum DogErrors: Error, LocalizedError {
    case imageIssue
}

struct Dog: Codable {
    var message: String
    var status: String
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case status = "status"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(String.self, forKey: CodingKeys.message)
        self.status = try container.decode(String.self, forKey: CodingKeys.status)
    }
}
