//
//  SeriesRowViewTests.swift
//  MarvelAppTests
//
//  Created by Joaquín Corugedo Rodríguez on 22/10/22.
//

import XCTest
import ViewInspector

extension SeriesRowView: Inspectable {}

final class SeriesRowViewTests: XCTestCase {
    
    var view:SeriesRowView?

    override func setUpWithError() throws {
        view = SeriesRowView(serie: Serie(id: 1, title: "Captain Carter (2022)", description: "", startYear: 1, endYear: 2, rating: "5", type: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/40/621d39b76a244", thumbnailExtension: "jpg")))
    }

    override func tearDownWithError() throws {
        view = nil
    }

    func test_Text_Content() throws {
        
        let text = try view.inspect().find(viewWithId: "text")
        XCTAssertNotNil(text)
        let texto = try text.text().string()
        
        XCTAssertEqual(texto, "Captain Carter (2022)")
    }

    func test_Image() throws {
        
        let image = try view.inspect().find(viewWithId: "image")
        XCTAssertNotNil(image)
    }

}
