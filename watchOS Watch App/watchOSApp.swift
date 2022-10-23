//
//  watchOSApp.swift
//  watchOS Watch App
//
//  Created by Joaquín Corugedo Rodríguez on 23/10/22.
//

import SwiftUI

@main
struct watchOS_Watch_AppApp: App {
    @StateObject var rootViewModel = RootViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(rootViewModel)
        }
    }
}
