//
//  MockFetchLocations.swift
//  WikiLocationsTests
//
//  Created by Mohamed Hassan on 04/05/2024.
//

import Foundation
@testable import WikiLocations

class MockFetchLocations: FetchLocationsProtocol {

    var mockedResult: MockNetworkResult

    init(mockedResult: MockNetworkResult = .success(json: "locations")) {
        self.mockedResult = mockedResult
    }

    func fetchLocations() async throws -> [WikiLocations.LocationPresentable] {
        switch mockedResult {
        case .success(let json):
            guard let filePath = Bundle(for: type(of: self)).path(forResource: json, ofType: "json") else {
                fatalError("Local Path: \(json) not found.")
            }
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
                let decoder = JSONDecoder()
                let locations = try decoder.decode(LocationModelResponse.self, from: data).locations
                return locations
            } catch {
                fatalError("Unable to load mock JSON data for path \(json).")
            }
        case .fail(let error):
            throw error
        }
    }
}
