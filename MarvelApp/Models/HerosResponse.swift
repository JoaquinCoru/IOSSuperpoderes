//
//  HerosModel.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 12/10/22.
//

import Foundation

// MARK: - HeroResponse
struct HeroResponse: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let offset, limit, total, count: Int
    let results: [Character]
}


struct Character:Codable, Identifiable {
    let id: Int
    let name, description: String
    let thumbnail: Thumbnail
    let resourceURI: String
//    let series: Serie
}


