//
//  BaseNetworkTests.swift
//  MarvelAppTests
//
//  Created by Joaquín Corugedo Rodríguez on 22/10/22.
//

import XCTest

final class BaseNetworkTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetMarvelCharacters(){
        
        let request = BaseNetwork().getMarvelCharacters()
        
        XCTAssertNotNil(request)
        XCTAssertEqual(request.httpMethod, HTTPMethods.get)
    }
    
    func testGetCharacterSeries(){
        
        let characterId = 1
        let request = BaseNetwork().getCharacterSeries(idCharacter: characterId)
        
        XCTAssertNotNil(request)
        XCTAssertEqual(request.httpMethod, HTTPMethods.get)
        
    }
}
