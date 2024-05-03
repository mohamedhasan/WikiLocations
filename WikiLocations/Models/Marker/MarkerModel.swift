//
//  MarkerModel.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 03/05/2024.
//

import Foundation

class MarkerModel: Identifiable {

    init(location: LocationPresentable) {
        self.location = location
    }
    var location: LocationPresentable
    var id: String {
        "\(location.title ?? "")-\(location.coordinate.latitude)-\(location.coordinate.longitude)"
    }
}
