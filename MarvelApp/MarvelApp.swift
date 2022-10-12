//
//  MarvelApp.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 12/10/22.
//

import SwiftUI

@main
struct MarvelApp: App {
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            RootView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
