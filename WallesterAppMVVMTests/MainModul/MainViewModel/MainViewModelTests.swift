//
//  ViewModelTests.swift
//  WallesterAppMVVMTests
//
//  Created by Максим on 21.04.2021.
//

import XCTest
@testable import WallesterAppMVVM

class ViewModelTests: XCTestCase {
    
    var mockAPIService: MockAPIService!
    var mockCoreDataService: MockCoreDataService!
    var sut: MainViewModel!
    
    override func setUp() {
        mockAPIService = MockAPIService()
        mockCoreDataService = MockCoreDataService()
        sut = MainViewModel(networkService: mockAPIService, coreDataService: mockCoreDataService)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchAllBeersTrue() {
        let expect = expectation(description: "Success result")
        sut.getBeers {(expect.fulfill())}
        mockAPIService.fetchSucess()
        
        wait(for: [expect], timeout: 1.0)
        XCTAssertTrue(sut.checkBeers)
    }
    
    func testFetchAllBeersFail() {
        sut.getBeers {()}
        mockAPIService.fetchFail()
        
        XCTAssertNil(sut.beers)
    }
    
    func testNumberOfRowsEqualsBeersFromNetwork() {
        let beers = [Beer(name: "Foo", abv: 0), Beer(name: "Baz", abv: 0)]
        mockAPIService.completeBeers = beers
        
        let expect = expectation(description: "Get beers")
        
        sut.getBeers {(expect.fulfill())}
        mockAPIService.fetchSucess()
        
        wait(for: [expect], timeout: 1.0)
        XCTAssertEqual(sut.numberOfRows(), beers.count)
    }
    
    func testGetCellViewModel() {
        fetchBeersFinished()
        
        let indexPath = IndexPath(row: 1, section: 0)
        let testBeer = mockAPIService.completeBeers[indexPath.row]
        
        let vm = sut.cellViewModel(forIndexPath: indexPath)
        
        XCTAssertEqual(vm?.nameOfBeer, testBeer.name)
    }
    
//    func testCellViewModel() {
//        
//    }
    
    func testGetViewModelForSelectedRow() {
        fetchBeersFinished()
        let indexPath = IndexPath(row: 1, section: 0)
        let testBeer = mockAPIService.completeBeers[indexPath.row]
        let vm = sut.viewModelForSelectedRow(atIndexPath: indexPath)
        
        XCTAssertEqual(vm?.label, testBeer.name)
        
    }

    
}

extension ViewModelTests {
    class MockAPIService: NetworkServiceProtocol{
        
        var completeBeers = [Beer]()
        var completeClousere: ((Result<[Beer]?, Error>) -> Void)!
        
        var error = NSError(domain: "", code: -1, userInfo: nil)
        
        func getBeers(completion: @escaping (Result<[Beer]?, Error>) -> Void) {
            completeClousere = completion
        }
        
        func fetchSucess() {
            completeClousere(.success(completeBeers))
        }
        
        func fetchFail() {
            completeClousere(.failure(error))
        }
    }
    
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
    
    private func fetchBeersFinished() {
        let beers = [Beer(name: "Foo", abv: 0), Beer(name: "Baz", abv: 0), Beer(name: "Bar", abv: 0)]
        mockAPIService.completeBeers = beers
        let expect = expectation(description: "Get beers")
        sut.getBeers {(expect.fulfill())}
        mockAPIService.fetchSucess()
        wait(for: [expect], timeout: 1.0)
    }
    
    
}


