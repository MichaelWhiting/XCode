//
//  Rep.swift
//  APIProject
//
//  Created by Michael Whiting on 12/2/22.
//

import Foundation

struct Rep: Codable {
    var name: String
    var state: String
    var district: String
    var phone: String
    var office: String
    var website: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case state = "state"
        case district = "district"
        case phone = "phone"
        case office = "office"
        case website = "website"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.state = try container.decode(String.self, forKey: .state)
        self.district = try container.decode(String.self, forKey: .district)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.office = try container.decode(String.self, forKey: .office)
        self.website = try container.decode(String.self, forKey: .website)
    }
    
}
