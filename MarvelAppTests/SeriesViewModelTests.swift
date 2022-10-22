//
//  SeriesViewModelTests.swift
//  MarvelAppTests
//
//  Created by Joaquín Corugedo Rodríguez on 22/10/22.
//

import XCTest
import Combine

final class SeriesViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetSeriesForCharacter(){
        var suscriptors = Set<AnyCancellable>()
        
        let expectation = self.expectation(description: "Descarga la lista de series")
        
        let idCharacter = 1017857
        let vm = SeriesViewModel(characterId: idCharacter)
        XCTAssertNotNil(vm)
        
        vm.$status.sink { estado in
            if estado == .loaded {
                XCTAssertEqual(1, 1)
                XCTAssertNotNil(vm.series)
                XCTAssertEqual(vm.series?[0].title, "Captain Carter (2022)")
                expectation.fulfill()
            }else if estado == .error {
                XCTAssertEqual(1, 2)
                expectation.fulfill()
            }
            
        }.store(in: &suscriptors)
        
        self.waitForExpectations(timeout: 10) //se esperan 10 segundos max. en la descarga
    }
    
    func testGetSeriesTesting(){
        
        let idCharacter = 1
        let vm = SeriesViewModel(characterId: idCharacter, testing: true)
        
        XCTAssertNotNil(vm.series)
        XCTAssertEqual(vm.series?[0].title, "Captain Carter (2022)")
    }

}
