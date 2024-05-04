//
//  MapViewModelTests.swift
//  WikiLocationsTests
//
//  Created by Mohamed Hassan on 04/05/2024.
//

import Foundation

import XCTest
import CoreLocation
@testable import WikiLocations

@MainActor
final class MapViewModelTests: XCTestCase {

    private var testEnvironment = TestEnvironment()

    func testInitialStateIsLoading() async throws {
        let viewModel = MapViewModel(environment: testEnvironment)
        XCTAssertEqual(viewModel.state, .loading)
    }

    func testLoadValidMarkers() async throws {
        let viewModel = MapViewModel(environment: testEnvironment)
        await viewModel.loadMarkers()
        XCTAssertEqual(viewModel.state, .loaded)
        XCTAssertFalse(viewModel.markers.isEmpty)
    }

    func testShowErrorWhenNoMarkersAvailable() async throws {
        testEnvironment.mockLocationsHandler.mockedResult = .success(json: "locations-empty")
        let viewModel = MapViewModel(environment: testEnvironment)
        await viewModel.loadMarkers()
        switch viewModel.state {
        case .error(let error):
            XCTAssertEqual(error, .noLocationsFound)
        default:
            XCTFail()
        }
    }

    func testShowErrorState() async throws {
        testEnvironment.mockLocationsHandler.mockedResult = .fail(error: .noInternetConnection)
        let viewModel = MapViewModel(environment: testEnvironment)
        await viewModel.loadMarkers()
        switch viewModel.state {
        case .error(let error):
            XCTAssertEqual(error, .noInternetConnection)
        default:
            XCTFail()
        }
    }

    func testToggleMarkerSelection() async throws {
        let markers = try await testEnvironment.markersProvider.loadMarkers()
        let viewModel = MapViewModel(environment: testEnvironment)
        await viewModel.loadMarkers()
        guard let marker = markers.first else {
            XCTFail()
            return
        }
        viewModel.toggleMarkerSelection(marker)
        XCTAssertTrue(marker.selected)
        XCTAssertNotNil(viewModel.selectedMarker)
        viewModel.toggleMarkerSelection(marker)
        XCTAssertFalse(marker.selected)
        XCTAssertNil(viewModel.selectedMarker)
    }

    func testAddUserDefinedMarkerEnabled() async throws {
        let viewModel = MapViewModel(environment: testEnvironment)
        await viewModel.loadMarkers()
        viewModel.customLocationEnabled = true
        viewModel.addUserDefinedMarker(CLLocationCoordinate2DMake(23.2322, 44.232))
        XCTAssertNotNil(viewModel.userDefinedMarker)
        XCTAssertTrue(viewModel.userDefinedMarker?.selected ?? false)
    }

    func testCustomLocationDisabled() async throws {
        let viewModel = MapViewModel(environment: testEnvironment)
        await viewModel.loadMarkers()
        viewModel.customLocationEnabled = false
        viewModel.addUserDefinedMarker(CLLocationCoordinate2DMake(23.2322, 44.232))
        XCTAssertNil(viewModel.userDefinedMarker)
    }

    func testRemovingUserDefinedMarkerOnCustomLocationDisabled() async throws {
        let viewModel = MapViewModel(environment: testEnvironment)
        await viewModel.loadMarkers()
        viewModel.customLocationEnabled = true
        viewModel.addUserDefinedMarker(CLLocationCoordinate2DMake(23.2322, 44.232))
        viewModel.customLocationEnabled = false
        XCTAssertNil(viewModel.userDefinedMarker)
    }

    func testExternalLinkCalled() async throws {
        let mockExternalLink = MockExternalLink()
        testEnvironment.mockExternalLinkHandler = mockExternalLink
        let viewModel = MapViewModel(environment: testEnvironment)
        await viewModel.loadMarkers()
        guard let marker = viewModel.markers.first else {
            XCTFail()
            return
        }
        viewModel.openExternalLink(marker)
        XCTAssertTrue(mockExternalLink.urlFetched)
    }
}
