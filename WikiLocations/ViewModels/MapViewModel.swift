//
//  MapViewModel.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 03/05/2024.
//

import Foundation

@MainActor
class MapViewModel: ObservableObject {
    private let environment: Environment
    private let markersProvider: MarkersProvider
    @Published var markers: [MarkerModel] = []
    @Published var state = MapMarkersState.loading

    init(environment: Environment) {
        self.environment = environment
        self.markersProvider = environment.markersProvider
    }

    public func loadMarkers() async {
        do {
            markers = try await markersProvider.loadMarkers()
            state = .loaded
        } catch {
            state = .error(error: error as? NetworkError ?? .unknownError)
        }
    }
}
