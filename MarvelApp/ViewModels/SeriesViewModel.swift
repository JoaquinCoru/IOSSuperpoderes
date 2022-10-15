//
//  HerosViewModel.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 12/10/22.
//

import Foundation
import Combine

final class SeriesViewModel:ObservableObject{
    
    var characterId:Int
    @Published var series:[Serie]?
    @Published var status = Status.loading
    
    private var suscriptors = Set<AnyCancellable>()
    
    init(characterId:Int, testing:Bool = false){
        
        self.characterId = characterId
        if (testing){
            getSeriesTesting()
        }else{
            //TODO: llamada a API
            getSeriesForCharacter()
        }
    }
    
    func getSeriesForCharacter(){
        URLSession.shared.dataTaskPublisher(for: BaseNetwork().getCharacterSeries(idCharacter: characterId))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                response.statusCode == 200 else{
                    throw URLError(.badServerResponse)
                }
                //devolvemos los datos que es el JSON
                return $0.data
            }
            .decode(type: SeriesResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .finished:
                    self.status = Status.loaded
                case .failure:
                    self.status = .error(error: "Error buscando Series")
                }
            } receiveValue: { data in
                self.series  = data.data.results
            }
            .store(in: &suscriptors)
    }
    
    //MARK: -Testing/Diseño
    func getSeriesTesting(){
        
        //Crear un array de 4 series y asignarlos a series.
        let serie1 = Serie(id: 1, title: "Captain Carter (2022)", description: "", startYear: 1, endYear: 2, rating: "5", type: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/40/621d39b76a244", thumbnailExtension: "jpg"))
        
        let serie2 = Serie(id: 2, title: "Captain America (2018 - Present)", description: "", startYear: 1, endYear: 2, rating: "5", type: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/9/a0/5b34097c5ea9d", thumbnailExtension: "jpg"))

        let serie3 = Serie(id: 3, title: "Operation: S.I.N. (2015)", description: "", startYear: 1, endYear: 2, rating: "5", type: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/70/54db8a19adb67", thumbnailExtension: "jpg"))

        let serie4 = Serie(id: 4, title: "Captain America and the First Thirteen (2011)", description: "", startYear: 1, endYear: 2, rating: "5", type: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/5696aeda0e63b", thumbnailExtension: "jpg"))
        

        self.series = [serie1, serie2, serie3, serie4]
        self.status = .loaded
    }
    
}
