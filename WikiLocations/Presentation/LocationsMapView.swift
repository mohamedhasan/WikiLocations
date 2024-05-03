//
//  ContentView.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 02/05/2024.
//

import SwiftUI

struct LocationsMapView: View {

    @StateObject private var viewModel: MapViewModel

    init(viewModel: MapViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .error(let error):
                ErrorRetryView(error: error) {
                    Task {
                        await viewModel.loadMarkers()
                    }
                }
            case .loaded:
                MapView().environment(viewModel)
            }
        }.task {
            await viewModel.loadMarkers()
        }
    }
}
