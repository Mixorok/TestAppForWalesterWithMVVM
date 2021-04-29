//
//  FavoriteViewModelTests.swift
//  WallesterAppMVVMTests
//
//  Created by Максим on 25.04.2021.
//

import XCTest
import CoreData
@testable import WallesterAppMVVM

class FavoriteViewModelTests: XCTestCase {
    
    var sut: FavoriteViewModel!
    var mockCoreDataService: MockCoreDataService!
    
    override func setUp() {
        mockCoreDataService = MockCoreDataService()
        sut = FavoriteViewModel(coreData: mockCoreDataService)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchAllBeersFromCoreDataTrue() {
        sut.loadData {()}
        mockCoreDataService.fetchSucess()
        XCTAssertTrue(sut.checkBeers)
    }
    
    func testNumberOfRows() {
        fetchBeersFromCoreDataFinished()
        sut.loadData {
            ()
        }
        mockCoreDataService.fetchSucess()
        XCTAssertEqual(sut.numberOfRows(), mockCoreDataService.completeBeers.count)
    }
    
}

extension FavoriteViewModelTests{
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
    
    private func fetchBeersFromCoreDataFinished() {
        let context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let beerOneInCoreData = FavoriteBeers(context: context)
        let beerTwoInCoreData = FavoriteBeers(context: context)
        beerOneInCoreData.name = "Foo"
        beerOneInCoreData.abv = 0
        beerTwoInCoreData.name = "Baz"
        beerTwoInCoreData.abv = 0
        let beer = [beerOneInCoreData, beerTwoInCoreData]
        
        mockCoreDataService.completeBeers = beer
        sut.loadData {()}
        mockCoreDataService.fetchSucess()
    }
    
}
