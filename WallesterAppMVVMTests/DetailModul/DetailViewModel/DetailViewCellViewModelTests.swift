//
//  DetailViewCellViewModelTests.swift
//  WallesterAppMVVMTests
//
//  Created by Максим on 25.04.2021.
//

import XCTest
@testable import WallesterAppMVVM

class DetailViewCellViewModelTests: XCTestCase {
    
    var sut: DetailViewCellViewModel!
    var beer: Beer!
    var indexPath: IndexPath!

    override func setUp()  {
        beer = Beer(name: "Foo", abv: 0, ebc: 0, ibu: 0, favorite: true)
        indexPath = IndexPath(row: 0, section: 0)
        sut = DetailViewCellViewModel(beer: beer, indexPath: indexPath)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNameOfBeerByIndexPath() {
        indexPath = IndexPath(row: 0, section: 0)
        sut.indexPath = indexPath
        XCTAssertEqual(sut.nameOfBeer, "Name: \(beer.name)")
    }
    
    func testAbvOfBeerByIndexPath() {
        indexPath = IndexPath(row: 1, section: 0)
        sut.indexPath = indexPath
        XCTAssertEqual(sut.nameOfBeer, "Alcohol: \(beer.abv)")
    }
    
    func testEbcOfBeerByIndexPath() {
        indexPath = IndexPath(row: 2, section: 0)
        sut.indexPath = indexPath
        XCTAssertEqual(sut.nameOfBeer, "EBC: \(beer.ebc ?? 0)")
    }
    
    func testIbuOfBeerByIndexPath() {
        indexPath = IndexPath(row: 3, section: 0)
        sut.indexPath = indexPath
        XCTAssertEqual(sut.nameOfBeer, "IBU: \(beer.ibu ?? 0)")
    }

}
