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
    @StateObject var rootViewModel = RootViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(rootViewModel)
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
