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
        //        return path + "/portrait_small."  + thumbnailExtension
    }
    
    var seriePath:String{
#if os(watchOS)
        return path + "/portrait_uncanny." + thumbnailExtension
#else
        return path + "/portrait_small." + thumbnailExtension
#endif
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
