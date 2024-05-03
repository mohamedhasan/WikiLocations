//
//  LocationModel+MarkerRepresentable.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 02/05/2024.
//

import Foundation
import CoreLocation

extension LocationModel: LocationPresentable {
    
    var title: String? {
        name
    }

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2DMake(lat, long)
    }
}
