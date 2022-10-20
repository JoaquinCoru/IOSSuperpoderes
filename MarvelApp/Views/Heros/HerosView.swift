//
//  HerosView.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 12/10/22.
//

import SwiftUI

struct HerosView: View {
    @EnvironmentObject var rootViewModel:RootViewModel
    @State private var filter:String = ""
    
    var body: some View {
        NavigationStack{
            List{
                if let heros = rootViewModel.heros{
                    ForEach(heros) { hero in
                        NavigationLink {
                            SeriesRootView(characterName: hero.name, viewModel: SeriesViewModel(characterId: hero.id))
                        } label: {
                            HerosRowView(hero: hero)
                                .listRowBackground(Color.red)
                        }
                        .foregroundColor(.black)
                    }
                }
            }
            .searchable(text: $filter, prompt: "Buscar personaje...")
            .onChange(of: filter) { newValue in
                //Resuelvo fallo que da en la API cuando hay espacios en la búsqueda
                let newString = newValue.replacingOccurrences(of: " ", with: "%20")
                //Para que solo haga búsquedas cuando haya más de 3 letras
                if (newString.count > 3 || newString == "" ){
                    rootViewModel.getHeros(filterName: newString)
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
