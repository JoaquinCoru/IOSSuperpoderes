//
//  HerosView.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 12/10/22.
//

import SwiftUI

struct HerosView: View {
    @EnvironmentObject var rootViewModel:RootViewModel
    
    var body: some View {
        NavigationStack{
            List{
                if let heros = rootViewModel.heros{
                    ForEach(heros) { hero in
                        NavigationLink {
                            SeriesView( characterName: hero.name, viewModel: SeriesViewModel(characterId: hero.id))
                        } label: {
                            HerosRowView(hero: hero)
                        }
                    }
                }
            }

        }
    }
}


struct HerosView_Previews: PreviewProvider {
    static var previews: some View {
        HerosView()
            .environmentObject(RootViewModel(testing: true))
        
    }
}
