//
//  WikiExternalLinkTests.swift
//  WikiLocationsTests
//
//  Created by Mohamed Hassan on 04/05/2024.
//

import XCTest
import CoreLocation
@testable import WikiLocations

final class WikiExternalLinkTests: XCTestCase {
    
    func testCanProvideURLForValidLocation() throws {
        let linkFactory = WikiExternalLink()
        let model = LocationModel(name: "India",
                                  lat: 23.23423,
                                  long: 45.23023)
        if let url = linkFactory.url(for: model) {
            XCTAssertEqual(
                url.absoluteString,
                "wikipedia://location?latitude=23.23423&longitude=45.23023&name=India")
        } else {
            XCTFail()
        }
    }

}

