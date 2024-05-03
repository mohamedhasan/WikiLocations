//
//  MapView.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 03/05/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var viewModel: MapViewModel
    var body: some View {
        Map {
            ForEach(viewModel.markers, content: { marker in
                Marker(marker.location.title ?? "", coordinate: marker.location.coordinate)
            })
        }
    }
}
