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
    @State var userDefinedMarker: MarkerModel?
    @State var markers: [MarkerModel] = []
    @State var customLocationEnabled: Bool = false

    var body: some View {
        MapReader { proxy in
            Map {
                ForEach(markers, content: { marker in
                    Annotation(marker.location.title ?? "", coordinate: marker.location.coordinate) {
                        MarkerAnnotationView()
                            .environmentObject(viewModel)
                            .environmentObject(marker)
                            .accessibilityIdentifier(marker.id)
                    }
                })
                if let userDefinedMarker = userDefinedMarker, customLocationEnabled {
                    Annotation(
                        userDefinedMarker.location.title ?? "",
                        coordinate: userDefinedMarker.location.coordinate) {
                        MarkerAnnotationView()
                            .environmentObject(viewModel)
                            .environmentObject(userDefinedMarker)
                    }
                }
            }.onTapGesture { position in
                guard customLocationEnabled else {
                    return
                }
                if let coordinate = proxy.convert(position, from: .local) {
                    viewModel.addUserDefinedMarker(coordinate)
                }
            }.onReceive(viewModel.$userDefinedMarker, perform: { marker in
                userDefinedMarker = marker
            }).onReceive(viewModel.$customLocationEnabled, perform: { enabled in
                customLocationEnabled = enabled
            }).onReceive(viewModel.$markers, perform: { fetchedMarkers in
                markers = fetchedMarkers
            })
        }
    }
}
