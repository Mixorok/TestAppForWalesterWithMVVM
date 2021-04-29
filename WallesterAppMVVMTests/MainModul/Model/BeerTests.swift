//
//  BeerTests.swift
//  WallesterAppMVVMTests
//
//  Created by Максим on 14.04.2021.
//

import XCTest
@testable import WallesterAppMVVM

class BeerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitBeerWithNameAndAbv() {
        let beer = Beer(name: "Foo", abv: 10)
        
        XCTAssertNotNil(beer)
    }
    
    func testInitBeerWithAllParameters() {
        let beer = Beer(name: "Foo", abv: 0, ebc: 0, ibu: 0, favorite: true)
        
        XCTAssertNotNil(beer)
    }
    
    func testWhenGivenNameSetsName() {
        let beer = Beer(name: "Foo", abv: 0)
        XCTAssertTrue(beer.name == "Foo")
    }
    
    func testWhenGivenAbvSetsAbv() {
        let beer = Beer(name: "Foo", abv: 0)
        XCTAssertTrue(beer.abv == 0)
    }
    
    func testWhenGivenEbcSetsEbc() {
        let beer = Beer(name: "Foo", abv: 0, ebc: 0, ibu: 0, favorite: true)
        XCTAssertTrue(beer.ebc == 0)
    }
    
    func testWhenGivenIbuSetsIbu() {
        let beer = Beer(name: "Foo", abv: 0, ebc: 0, ibu: 0, favorite: true)
        XCTAssertTrue(beer.ibu == 0)
    }
    
    func testWhenGivenFavoriteSetsFavorite() {
        let beer = Beer(name: "Foo", abv: 0, ebc: 0, ibu: 0, favorite: true)
        XCTAssertTrue(beer.favorite == true)
    }
    

}
