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

    func testMarkerContainsAccurateID() throws {
        let location = LocationModel(name: "India",
                                     lat: 23.54042,
                                     long: 45.3434)
        let markerModel = MarkerModel(location: location)
        XCTAssertEqual(markerModel.id, "India-23.54042-45.3434")
    }

    func testMarkerDefaultType() throws {
        let location = LocationModel(name: "India",
                                     lat: 23.54042,
                                     long: 45.3434)
        let markerModel = MarkerModel(location: location)
        XCTAssertEqual(markerModel.type, .locationMarker)
    }

    func testMarkerNotSelectedByDefault() throws {
        let location = LocationModel(name: "India",
                                     lat: 23.54042,
                                     long: 45.3434)
        let markerModel = MarkerModel(location: location)
        XCTAssertFalse(markerModel.selected)
    }

    func testMarkerEqutable() throws {
        let location1 = LocationModel(name: "India",
                                     lat: 23.54042,
                                     long: 45.3434)
        let location2 = LocationModel(name: "India",
                                     lat: 23.54042,
                                     long: 45.3434)
        let markerModel1 = MarkerModel(location: location1)
        let markerModel2 = MarkerModel(location: location2)
        XCTAssertEqual(markerModel1, markerModel2)
    }
}
