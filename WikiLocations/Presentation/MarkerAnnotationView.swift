//
//  MarkerAnnotationView.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 03/05/2024.
//

import Foundation
import SwiftUI

struct MarkerAnnotationView: View {
    @StateObject var model: MarkerModel
    @EnvironmentObject var viewModel: MapViewModel

    var body: some View {
        VStack(spacing: 0) {
            VStack {
                HStack {
                    Text(model.location.title ?? "")
                        .font(.callout)
                        .opacity(model.selected && (model.location.title != nil) ? 1 : 0)
                    Button("", systemImage: DesignSystem.shared.assets.openInWikiIconName, action: {
                        
                    })
                }
                .padding(DesignSystem.shared.spacer.small)
                .background(Color(.white))
                .cornerRadius(DesignSystem.shared.spacer.medium)
                .opacity(model.selected ? 1 : 0)
                Image(systemName: DesignSystem.shared.assets.mapPin)
                    .font(.title)
                    .foregroundColor(.red)
                Image(systemName: DesignSystem.shared.assets.mapArrow)
                    .font(.caption)
                    .foregroundColor(.red)
                    .offset(x: 0, y: -DesignSystem.shared.spacer.small)
            }.onTapGesture {
                viewModel.toggleMarker(model)
            }
        }
    }
}

