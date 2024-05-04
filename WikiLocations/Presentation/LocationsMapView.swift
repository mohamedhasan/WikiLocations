//
//  ContentView.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 02/05/2024.
//

import SwiftUI

struct LocationsMapView: View {

    @StateObject private var viewModel: MapViewModel
    @State var state: MapMarkersState = .loading

    init(viewModel: MapViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                switch state {
                case .loading:
                    ProgressView()
                case .error(let error):
                    ErrorRetryView(error: error) {
                        Task {
                            await viewModel.loadMarkers()
                        }
                    }
                case .loaded:
                    MapView().environmentObject(viewModel)
                }
            }.task {
                await viewModel.loadMarkers()
            }
            if state == .loaded {
                MapHeader()
                    .environmentObject(viewModel)
            }
        }.onReceive(viewModel.$state, perform: { markersState in
            state = markersState
        })
    }
}
