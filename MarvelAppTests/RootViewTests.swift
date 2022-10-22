//
//  RootViewTests.swift
//  MarvelAppTests
//
//  Created by Joaquín Corugedo Rodríguez on 22/10/22.
//

import SwiftUI
import XCTest
import ViewInspector

extension RootView:Inspectable{}

final class RootViewTests: XCTestCase {
    
    func test_Number_Of_Views() throws {

        let viewModel = RootViewModel()
        let view = RootView().environmentObject(viewModel)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
    }
    
    func test_View_Is_Loader_When_Status_Is_Loading() throws {
        let viewModel = RootViewModel()
        let view = RootView().environmentObject(viewModel)
        
        viewModel.status = .loading
        
        let loaderView = try view.inspect().find(viewWithId: "LoaderView")
        XCTAssertNotNil(loaderView)
    }
    
    func test_View_Is_HerosView_When_Status_Is_Loaded() throws {
        let viewModel = RootViewModel()
        let view = RootView().environmentObject(viewModel)
        
        viewModel.status = .loaded
        
        let loaderView = try view.inspect().find(viewWithId: "HerosView")
        XCTAssertNotNil(loaderView)
    }
    
    func test_View_Is_ErrorHerosView_When_Status_Is_Error() throws {
        let viewModel = RootViewModel()
        let view = RootView().environmentObject(viewModel)
        
        viewModel.status = .error
        
        let loaderView = try view.inspect().find(viewWithId: "ErrorHerosView")
        XCTAssertNotNil(loaderView)
    }
    
}
