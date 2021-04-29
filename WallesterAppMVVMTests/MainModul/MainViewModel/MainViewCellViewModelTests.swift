//
//  MainViewCellTests.swift
//  WallesterAppMVVMTests
//
//  Created by Максим on 25.04.2021.
//

import XCTest
@testable import WallesterAppMVVM

class MainViewCellViewModelTests: XCTestCase {
    
    var sut: MainViewCellViewModel!
    var mockCoreDataService: MockCoreDataService!
    var beer = Beer(name: "Foo", abv: 0, ebc: 0, ibu: 0, favorite: true)
    
    override func setUp() {
        mockCoreDataService = MockCoreDataService()
        sut = MainViewCellViewModel(beer: beer, coreDataService: mockCoreDataService)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSaveInCoreData() {
        
    }
    
    func testInitViewModel() {
        let beer = Beer(name: "Foo", abv: 0, ebc: 0, ibu: 0, favorite: true)
        XCTAssertEqual(beer.name, sut.nameOfBeer)
        
    }
    
}

extension MainViewCellViewModelTests {
    class MockCoreDataService: CoreDataProtocol {
        func loadData(completion: @escaping (Result<[FavoriteBeers], Error>) -> ()) {
            
        }
        
        func saveData(_ beer: Beer) {
            
        }
        
        func deleteData(_ beer: Beer) {
            
        }
        
        func checkData(_ beer: Beer) -> Bool {
            return true
        }
    }
}
