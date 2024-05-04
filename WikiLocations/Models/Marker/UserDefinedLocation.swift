//
//  UserDefinedLocation.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 04/05/2024.
//

import Foundation
import MapKit

struct UserDefinedLocation: LocationPresentable {
    var title: String? {
        return nil
    }
    let coordinate: CLLocationCoordinate2D
}
