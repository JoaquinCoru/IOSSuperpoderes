//
//  RootViewModel.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 12/10/22.
//

import Foundation
import Combine

final class RootViewModel:ObservableObject{
    @Published var heros:[Character]?
    @Published var status:Status = Status.loading
    
    private var suscriptors = Set<AnyCancellable>()
    
    init(testing:Bool = false){
 
        if (testing){
            getHerosTesting()
        }else{
            //TODO: llamada a API
            getHeros()
        }
    }
    
    func getHeros(filterName:String = ""){
        
        URLSession.shared.dataTaskPublisher(for: BaseNetwork().getMarvelCharacters(filterName: filterName))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else{
                    throw URLError(.badServerResponse)
                }
                
                return $0.data
            }
            .decode(type: HeroResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .finished:
                    self.status = Status.loaded
                case .failure(let error):
                    self.status = .error
                    print(String(describing: error))
                }
            } receiveValue: { data in
                self.heros = data.data.results
            }
            .store(in: &suscriptors)

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
