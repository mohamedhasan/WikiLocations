//
//  MarkersProvider.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 03/05/2024.
//

import Foundation

class MarkersProvider {
    let fetchLocationsHandler: FetchLocationsProtocol

    init(fetchLocationsHandler: FetchLocationsProtocol) {
        self.fetchLocationsHandler = fetchLocationsHandler
    }

    func loadLocations() async throws -> [MarkerModel] {
        let locations = try await fetchLocationsHandler.fetchLocations()
        return locations.map({ MarkerModel(location: $0) })
    }
}
