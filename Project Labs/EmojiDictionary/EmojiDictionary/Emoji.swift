//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Michael Whiting on 10/18/22.
//

import Foundation

struct Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String

    static var saveFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("EmojiSaveData.json")
    
    static func saveToFile(emojis: [Emoji]) {
        guard let emojisObject = try? JSONEncoder().encode(emojis) else { return }
        do {
            try emojisObject.write(to: saveFileURL)
        } catch {
            print(error)
        }
    }
    
    static func loadFromFile() -> [Emoji] {
        let data = try! Data(contentsOf: saveFileURL)
        do {
            return try JSONDecoder().decode([Emoji].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}



