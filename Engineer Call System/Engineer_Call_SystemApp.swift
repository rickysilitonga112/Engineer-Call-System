//
//  Engineer_Call_SystemApp.swift
//  Engineer Call System
//
//  Created by Ricky Silitonga on 18/10/23.
//

import SwiftUI
import SwiftData

@main
struct Engineer_Call_SystemApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
