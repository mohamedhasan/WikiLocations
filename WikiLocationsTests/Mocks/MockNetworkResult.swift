//
//  MockNetworkResult.swift
//  WikiLocationsTests
//
//  Created by Mohamed Hassan on 04/05/2024.
//

import Foundation
@testable import WikiLocations

enum MockNetworkResult {
    case success(json: String)
    case fail(error: NetworkError)
}
