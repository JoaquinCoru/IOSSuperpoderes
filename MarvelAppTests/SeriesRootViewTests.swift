//
//  SeriesRootViewTests.swift
//  MarvelAppTests
//
//  Created by Joaquín Corugedo Rodríguez on 22/10/22.
//

import XCTest
import ViewInspector

extension SeriesRootView:Inspectable{}

final class SeriesRootViewTests: XCTestCase {
    
    let idCharacter = 1017857
    let nameCharacter = "Peggy Carter"
    var viewModel:SeriesViewModel?
    var view:SeriesRootView?
    
    
    override func setUpWithError() throws {
        viewModel = SeriesViewModel(characterId: idCharacter)
        view = SeriesRootView(characterName: nameCharacter, viewModel: self.viewModel!)
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        view = nil
    }


    func test_Number_Of_Views() throws {

        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
    }
    
    func test_View_Is_Loader_When_Status_Is_Loading() throws {
        
        viewModel?.status = .loading
        
        let loaderView = try view.inspect().find(viewWithId: "LoaderView")
        XCTAssertNotNil(loaderView)
    }
    
    func test_View_Is_HerosView_When_Status_Is_Loaded() throws {

        viewModel?.status = .loaded
        
        let loaderView = try view.inspect().find(viewWithId: "SeriesView")
        XCTAssertNotNil(loaderView)
    }
    
    func test_View_Is_ErrorHerosView_When_Status_Is_Error() throws {
        
        viewModel?.status = .error
        
        let loaderView = try view.inspect().find(viewWithId: "ErrorSeriesView")
        XCTAssertNotNil(loaderView)
    }

}
