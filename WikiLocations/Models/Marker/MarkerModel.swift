//
//  MarkerModel.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 03/05/2024.
//

import Foundation

class MarkerModel: Identifiable {

    init(location: LocationRepresentable) {
        self.location = location
    }
    var location: LocationRepresentable
    var id: String {
        "\(location.title ?? "")-\(location.coordinate.latitude)-\(location.coordinate.longitude)"
    }
}
