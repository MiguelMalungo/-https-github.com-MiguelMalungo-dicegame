//
//  dicegameApp.swift
//  dicegame
//
//  Created by JOSE MIGUEL FERRAZ GUEDES on 07/04/2023.
//

import SwiftUI

@main
struct dicegameApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
