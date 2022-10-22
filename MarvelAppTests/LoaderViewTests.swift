//
//  LoaderViewTests.swift
//  MarvelAppTests
//
//  Created by Joaquín Corugedo Rodríguez on 22/10/22.
//
import SwiftUI
import Combine
import ViewInspector  // libreria testing de UI https://github.com/nalexn/ViewInspector
import XCTest

@testable import MarvelApp

extension LoaderView:Inspectable {}

final class LoaderViewTests: XCTestCase {


    func test_Image_Exists() throws {
        let view = LoaderView()
        
        let image = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(image)
    }
    
    func test_LoaderView_Text() throws {
        let view = LoaderView()
        
        let text = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(text)
        let texto = try text.text().string()
        XCTAssertEqual(texto, "Cargando...")
    }

}
