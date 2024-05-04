//
//  MockExternalLink.swift
//  WikiLocationsTests
//
//  Created by Mohamed Hassan on 04/05/2024.
//

import Foundation
@testable import WikiLocations

class MockExternalLink: ExternalLinkProtocol {
    var schema: String = "schema"
    var host: String = "host"

    var urlFetched: Bool = false

    func url(for location: LocationPresentable) -> URL? {
        urlFetched = true
        return nil
    }
}
