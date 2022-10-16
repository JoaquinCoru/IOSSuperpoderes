//
//  BaseNetwork.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 15/10/22.
//

import Foundation

let apiKey = "d72aea39392229f66a932d0911077b21"
let hash = "3217f92be7a204d3d005647bc7fd7a43"
let ts = "1"


let server = "https://gateway.marvel.com/v1/public"


struct HTTPMethods{
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
}

enum endpoints:String {
    case characters = "/characters"
    case series = "/series"
}


struct BaseNetwork{
    
    
    func getMarvelCharacters() -> URLRequest{
        let urlCad:String = "\(server)\(endpoints.characters.rawValue)?apikey=\(apiKey)&ts=\(ts)&hash=\(hash)&orderBy=-modified"
                
        var request = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.get
        
        return request
    }
    
    func getCharacterSeries(idCharacter:Int) -> URLRequest {
        let urlCad:String = "\(server)\(endpoints.characters.rawValue)/\(idCharacter)\(endpoints.series.rawValue)?apikey=\(apiKey)&ts=\(ts)&hash=\(hash)&orderBy=-modified"
        
        var request = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.get
        
        return request
    }
}


