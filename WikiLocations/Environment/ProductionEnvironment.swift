//
//  ProductionEnvironment.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 03/05/2024.
//

import Foundation

class ProductionEnvironment: Environment {
    var markersProvider: MarkersProvider {
        let fetchLocationsHandler = FetchLocationsHandler()
     return MarkersProvider(fetchLocationsHandler: fetchLocationsHandler)
    }
}
