//
//  HerosModel.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 12/10/22.
//

import Foundation

struct Heros:Codable, Identifiable {
    var id: UUID
    var name:String
}
