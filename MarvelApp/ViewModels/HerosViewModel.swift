//
//  HerosViewModel.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 12/10/22.
//

import Foundation
import Combine

final class HerosViewModel:ObservableObject{
    @Published var heros:[Heros]?
    @Published var status = Status.loading
    
    private var suscriptors = Set<AnyCancellable>()
    
    init(testing:Bool = false){
        
        if (testing){
            getHerosTesting()
        }else{
            //TODO: llamada a APi
        }
    }
    
    //MARK: -Testing/Diseño
    func getHerosTesting(){
        
        //Crear un array de 4 heroes y asignarlos a heros.
        
        let hero1 = Heros(id: UUID(), name: "Spiderman")
        let hero2 = Heros(id: UUID(), name: "Capitán América")
        let hero3 = Heros(id: UUID(), name: "Lobezno")
        let hero4 = Heros(id: UUID(), name: "Hulk")
        
        self.heros = [hero1,hero2,hero3,hero4]
        
        self.status = .loaded
    }
    
}
