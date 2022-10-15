//
//  HerosViewModel.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 12/10/22.
//

import Foundation
import Combine

final class HerosViewModel:ObservableObject{
    @Published var heros:[Character]?
    @Published var status = Status.loading
    
    private var suscriptors = Set<AnyCancellable>()
    
    init(testing:Bool = false){
        
        if (testing){
            getHerosTesting()
        }else{
            //TODO: llamada a API
        }
    }
    
    //MARK: -Testing/Diseño
    func getHerosTesting(){
        
        //Crear un array de 4 heroes y asignarlos a heros.
        
        let hero1 = Character(id: 1, name: "Hit-Monkey", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: "jpg"), resourceURI: "")
        
        let hero2 = Character(id: 2, name: "Ghost Rider (Robbie Reyes)", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/1/10/622795c13e687", thumbnailExtension: "jpg"), resourceURI: "")
        
        let hero3 = Character(id: 3, name: "Attuma", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/9/90/4ce5a862a6c48", thumbnailExtension: "jpg"), resourceURI: "")
        
        let hero4 = Character(id: 4, name: "Outlaw (Inez Temple)", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/4ce59d3a80ff7", thumbnailExtension: "jpg"), resourceURI: "")
        
        self.heros = [hero1,hero2,hero3,hero4]
        
        self.status = .loaded
    }
    
}
