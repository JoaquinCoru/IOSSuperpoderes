//
//  ContentView.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 12/10/22.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootViewModel:RootViewModel
    
    var body: some View {
        switch rootViewModel.status{
        case Status.loading:
            LoaderView()
        case Status.loaded:
            Text("Lista heroes")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(RootViewModel())
    }
}