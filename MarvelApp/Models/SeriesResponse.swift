//
//  SeriesResponse.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 15/10/22.
//

import Foundation

struct SeriesResponse:Codable{
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataSerie
}

struct DataSerie: Codable {
    let offset, limit, total, count: Int
    let results: [Serie]
}

struct Serie:Codable, Identifiable{
    let id: Int
    let title: String
    let description: String?
    let startYear, endYear: Int
    let rating, type: String
    let thumbnail: Thumbnail
}
