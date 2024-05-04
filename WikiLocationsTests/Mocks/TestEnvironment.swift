//
//  TestEnvironment.swift
//  WikiLocationsTests
//
//  Created by Mohamed Hassan on 04/05/2024.
//

import Foundation
@testable import WikiLocations

class TestEnvironment: Environment {

    var mockLocationsHandler = MockFetchLocations()
    var mockExternalLinkHandler: ExternalLinkProtocol?

    var markersProvider: MarkersProvider {
     return MarkersProvider(fetchLocationsHandler: mockLocationsHandler)
    }

    var externalLinkHandler: ExternalLinkProtocol {
        return mockExternalLinkHandler ?? MockExternalLink()
    }
}
