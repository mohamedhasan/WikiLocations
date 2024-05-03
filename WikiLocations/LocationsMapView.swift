//
//  ContentView.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 02/05/2024.
//

import SwiftUI
import MapKit

struct LocationsMapView: View {

    @State private var markers: [MarkerModel] = []

    var body: some View {
        VStack {
            Map {
                ForEach(markers, content: { marker in
                    Marker(marker.location.title ?? "", coordinate: marker.location.coordinate)
                })
            }
        }
        .padding()
    }
}

//#Preview {
//    LocationsMapView<LocationModel>()
//}
