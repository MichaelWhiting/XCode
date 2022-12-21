//
//  Order.swift
//  OrderApp
//
//  Created by Michael Whiting on 12/7/22.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
