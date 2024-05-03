//
//  MapViewModel.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 03/05/2024.
//

import Foundation
import UIKit

@MainActor
class MapViewModel: ObservableObject, Observable {
    private let environment: Environment
    private let markersProvider: MarkersProvider
    private var selectedMarker: MarkerModel?

    @Published var markers: [MarkerModel] = []
    @Published var state = MapMarkersState.loading

    init(environment: Environment) {
        self.environment = environment
        self.markersProvider = environment.markersProvider
    }

    public func loadMarkers() async {
        do {
            markers = try await markersProvider.loadMarkers()
            if markers.isEmpty {
                state = .error(error: .noLocationsFound)
            } else {
                state = .loaded
            }
        } catch {
            state = .error(error: error as? NetworkError ?? .unknownError)
        }
    }

    public func toggleMarker(_ marker: MarkerModel) {
        guard markers.contains(marker) else {
            return
        }
        if marker.selected {
            marker.selected = false
            selectedMarker = nil
        } else {
            selectedMarker?.selected.toggle()
            selectedMarker = marker
            marker.selected = true
        }
    }

    public func openExternalLink(_ marker: MarkerModel) {
        let externalLinkHandler = environment.externalLinkHandler
        guard let url = externalLinkHandler.url(for: marker.location) else {
            return
        }
        UIApplication.shared.open(url)
    }
}
