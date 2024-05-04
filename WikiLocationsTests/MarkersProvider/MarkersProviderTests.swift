//
//  MarkersProvider.swift
//  WikiLocationsTests
//
//  Created by Mohamed Hassan on 04/05/2024.
//

import Foundation

import XCTest
import CoreLocation
@testable import WikiLocations

final class MarkersProviderTests: XCTestCase {
    
    func testProviderHasResults() async throws {
        let locationsHandler = MockFetchLocations()
        let locations = try await locationsHandler.fetchLocations()
        let markersProvider = MarkersProvider(fetchLocationsHandler: locationsHandler)
        let markers = try await markersProvider.loadMarkers()
        XCTAssertEqual(markers.count, locations.count)
    }

    func testProviderThrowsErrors() async throws {
        let locationsHandler = MockFetchLocations(mockedResult: .fail(error: .invalidData))
        let markersProvider = MarkersProvider(fetchLocationsHandler: locationsHandler)
        do {
            let _ = try await markersProvider.loadMarkers()
        } catch {
            if let networkError = error as? NetworkError {
                XCTAssertEqual(networkError, NetworkError.invalidData)
                return
            } else {
                XCTFail()
            }
        }
        XCTFail("Didn't throw error")
    }
}
