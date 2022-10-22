//
//  HerosRowViewTests.swift
//  MarvelAppTests
//
//  Created by Joaquín Corugedo Rodríguez on 22/10/22.
//

import XCTest
import ViewInspector

extension HerosRowView:Inspectable{}

final class HerosRowViewTests: XCTestCase {
    
    var view:HerosRowView?
    

    override func setUpWithError() throws {
        view = HerosRowView(hero: Character(id: 1, name: "Hit-Monkey", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: "jpg"), resourceURI: ""))
    }

    override func tearDownWithError() throws {
        view = nil
    }

    func test_Text_Content() throws {
        
        let text = try view.inspect().find(viewWithId: "text")
        XCTAssertNotNil(text)
        let texto = try text.text().string()
        
        XCTAssertEqual(texto, "Hit-Monkey")
    }

    func test_Image() throws {
        
        let image = try view.inspect().find(viewWithId: "image")
        XCTAssertNotNil(image)
    }

}
