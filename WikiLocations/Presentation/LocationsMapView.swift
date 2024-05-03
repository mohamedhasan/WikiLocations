//
//  ContentView.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 02/05/2024.
//

import SwiftUI
import MapKit

struct LocationsMapView: View {

    @StateObject private var viewModel: MapViewModel

    init(viewModel: MapViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            Map {
                ForEach(viewModel.markers, content: { marker in
                    Marker(marker.location.title ?? "", coordinate: marker.location.coordinate)
                })
            }
        }.task {
            await viewModel.loadMarkers()
        }
        .padding()
    }
}

//#Preview {
//    LocationsMapView<LocationModel>()
//}
