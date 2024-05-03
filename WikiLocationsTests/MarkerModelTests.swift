//
//  MarkerModelTests.swift
//  WikiLocationsTests
//
//  Created by Mohamed Hassan on 03/05/2024.
//

import XCTest
import CoreLocation
@testable import WikiLocations

final class MarkerModelTests: XCTestCase {
    
    func testMarkerContainsCoordinate() throws {
        let location = LocationModel(name: "India",
                                     lat: 23.54042,
                                     long: 45.3434)
        let markerModel = MarkerModel(location: location)
        let coordinate = CLLocationCoordinate2D(latitude: 23.54042, longitude: 45.3434)
        XCTAssertEqual(markerModel.location.coordinate.latitude, coordinate.latitude)
        XCTAssertEqual(markerModel.location.coordinate.longitude, coordinate.longitude)
    }

    func testMarkerContainsTitle() throws {
        let location = LocationModel(name: "India",
                                     lat: 23.54042,
                                     long: 45.3434)
        let markerModel = MarkerModel(location: location)
        XCTAssertEqual(markerModel.location.title, "India")
    }
}
