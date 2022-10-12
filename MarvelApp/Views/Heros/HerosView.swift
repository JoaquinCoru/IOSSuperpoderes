//
//  HerosView.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 12/10/22.
//

import SwiftUI

struct HerosView: View {
    @EnvironmentObject var rootViewModel:RootViewModel
    
    @StateObject var viewModel:HerosViewModel
    
    var body: some View {
        NavigationStack{
            List{
                if let heros = viewModel.heros{
                    ForEach(heros) { hero in
                        NavigationLink {
                            Text(hero.name)
                        } label: {
                            Text(hero.name)
                        }
                        
                    }
                }
            }
        }
    }
}

struct HerosView_Previews: PreviewProvider {
    static var previews: some View {
        HerosView(viewModel: HerosViewModel(testing: true))
    }
}
