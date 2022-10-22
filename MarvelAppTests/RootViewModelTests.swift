//
//  RootViewModelTests.swift
//  MarvelAppTests
//
//  Created by Joaquín Corugedo Rodríguez on 17/10/22.
//

import XCTest
import Combine
@testable import MarvelApp

final class RootViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetHeros() throws {
        var suscriptor = Set<AnyCancellable>()
        
        let expectation = self.expectation(description: "Descarga la lista de heroes")
        
        let vm = RootViewModel()
        XCTAssertNotNil(vm)
        
        vm.$status.sink { estado in
            //Cambia el estado
            if estado == .loaded {
                XCTAssertEqual(1, 1)
                XCTAssertNotNil(vm.heros)
                expectation.fulfill()
            } else if estado == .error {
                XCTAssertEqual(1, 2) //genero el error en el test
            }
        }
        .store(in: &suscriptor)
        
        //lanzamos la descarga de heroes
        vm.getHeros()
        
        self.waitForExpectations(timeout: 10) //se esperan 10 segundos max. en la descarga

    }
    
    func testGetHerosTesting(){
        
        let vm = RootViewModel(testing: true)
        
        XCTAssertNotNil(vm.heros)
        XCTAssertEqual(vm.heros?[0].name, "Hit-Monkey")
    }

}
