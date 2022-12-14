//
//  Thumbnail.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 15/10/22.
//

import Foundation

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: String
    
    var completePath:String{
        return path + "/landscape_xlarge."  + thumbnailExtension

    }
    
    var seriePath:String{
        #if os(watchOS)
        return path + "/standard_xlarge." + thumbnailExtension
        #else
        return path + "/portrait_xlarge." + thumbnailExtension
        #endif
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
