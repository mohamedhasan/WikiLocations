//
//  MapMarkersState.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 03/05/2024.
//

import Foundation

enum MapMarkersState: Equatable {
    case loading
    case loaded
    case error(error: NetworkError)
}
