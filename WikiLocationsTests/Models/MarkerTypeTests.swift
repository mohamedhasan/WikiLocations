//
//  MarkerTypeTests.swift
//  WikiLocationsTests
//
//  Created by Mohamed Hassan on 04/05/2024.
//

import XCTest
import CoreLocation
@testable import WikiLocations

final class MarkerTypeTests: XCTestCase {

    func testMarkerTypesHasDifferentPinColor() throws {
        let location = LocationModel(name: "India",
                                     lat: 23.54042,
                                     long: 45.3434)
        let locationMarker = MarkerModel(location: location)
        let userMarker = MarkerModel(location: location, .userDefined)
        XCTAssertNotEqual(locationMarker.type.pinColor, userMarker.type.pinColor)
    }
}
