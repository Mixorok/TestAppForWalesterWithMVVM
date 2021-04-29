//
//  DetailViewModelTests.swift
//  WallesterAppMVVMTests
//
//  Created by Максим on 25.04.2021.
//

import XCTest
@testable import WallesterAppMVVM

class DetailViewModelTests: XCTestCase {
    
    var sut: DetailViewModel!
    var mockCoreDataService: MockCoreDataService!

    override func setUp() {
        let beer = Beer(name: "Foo", abv: 0)
        mockCoreDataService = MockCoreDataService()
        sut = DetailViewModel(beer: beer, coreDataService: mockCoreDataService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitViewModel() {
        let beer = Beer(name: "Baz", abv: 0)
        sut.beer = beer
        
        XCTAssertEqual(sut.beer.name, beer.name)
    }

    func testIfFavoriteFalse() {
        
        let favorite = sut.ifIsFavorite()
        XCTAssertFalse(favorite)
    }
    
    func testIsFavoriteTrue() {
        let beer = Beer(name: "Foo", abv: 0, ebc: 0, ibu: 0, favorite: true)
        sut.beer = beer
        
        let favorite = sut.ifIsFavorite()
        XCTAssertTrue(favorite)
    }
    
    func testGetCellViewModel() {
        
        let indexPath = IndexPath(row: 0, section: 0)
        let testBeer = Beer(name: "Foo", abv: 0, ebc: 0, ibu: 0, favorite: true)
        
        let vm = sut.cellViewModel(forIndexPath: indexPath)
        
        XCTAssertEqual(vm?.beer.name, testBeer.name)
    }
    
    func testNumberOfRows() {
        XCTAssertEqual(sut.numberOfRows(), 4)
    }

}

extension DetailViewModelTests {
    class MockCoreDataService: CoreDataProtocol {
        
        
        var completeBeers = [FavoriteBeers]()
        var completeClousere: ((Result<[FavoriteBeers], Error>) -> ())!
        var error = NSError(domain: "", code: -1, userInfo: nil)
        
        func loadData(completion: @escaping (Result<[FavoriteBeers], Error>) -> ()) {
            completeClousere = completion
        }
    
        
        func saveData(_ beer: Beer) {
            
        }
        
        func deleteData(_ beer: Beer) {
            
        }
        
        func checkData(_ beer: Beer) -> Bool {
            return true
        }
        
        func fetchSucess() {
            completeClousere(.success(completeBeers))
        }
        
        func fetchFail() {
            completeClousere(.failure(error))
        }
    }
}
