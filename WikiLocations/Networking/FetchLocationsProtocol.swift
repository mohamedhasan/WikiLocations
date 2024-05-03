//
//  FetchLocationsProtocol.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 03/05/2024.
//

import Foundation

protocol FetchLocationsProtocol {
    func fetchLocations() async throws -> [LocationPresentable]
}
