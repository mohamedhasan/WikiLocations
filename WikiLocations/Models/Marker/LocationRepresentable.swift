//
//  LocationRepresentable.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 02/05/2024.
//

import Foundation
import CoreLocation

protocol LocationRepresentable {
    var title: String? { get }
    var coordinate: CLLocationCoordinate2D { get }
}
