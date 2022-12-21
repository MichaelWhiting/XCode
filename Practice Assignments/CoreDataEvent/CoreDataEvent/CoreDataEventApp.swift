//
//  CoreDataEventApp.swift
//  CoreDataEvent
//
//  Created by Michael Whiting on 12/9/22.
//

import SwiftUI

@main
struct CoreDataEventApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
