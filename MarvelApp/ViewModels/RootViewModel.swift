//
//  RootViewModel.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 12/10/22.
//

import Foundation
import Combine

final class RootViewModel:ObservableObject{
    @Published var status = Status.loading
    private var suscriptors = Set<AnyCancellable>()
    
    
}
