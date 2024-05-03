//
//  FetchLocationsHandler.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 03/05/2024.
//

import Foundation

class FetchLocationsHandler: FetchLocationsProtocol {
    func fetchLocations() async throws -> [LocationPresentable] {
        if NetworkReachability.shared.networkAvailable {
            throw NetworkError.noInternetConnection
        }
        guard let baseURLStr = Configurations.shared.endPoint, let baseURL = URL(string: baseURLStr) else {
            throw NetworkError.badURL
        }
        let url = baseURL
            .appendingPathComponent("abnamrocoesd/assignment-ios/main/locations.json")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        let locations = try decoder.decode([LocationModel].self, from: data)
        return locations
    }
}
