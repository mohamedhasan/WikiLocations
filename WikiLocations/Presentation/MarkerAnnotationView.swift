//
//  MarkerAnnotationView.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 03/05/2024.
//

import Foundation
import SwiftUI

struct MarkerAnnotationView: View {
    @EnvironmentObject var model: MarkerModel
    @EnvironmentObject var viewModel: MapViewModel
    @State var selected: Bool = false
    @AccessibilityFocusState var accessibilitySelected: Bool

    var body: some View {
        VStack(spacing: 0) {
            VStack {
                HStack {
                    Text(model.location.title ?? "")
                        .font(.callout)
                        .opacity(selected && (model.location.title != nil) ? 1 : 0)
                    Button("", systemImage: DesignSystem.shared.assets.openInWikiIconName, action: {
                        viewModel.openExternalLink(model)
                    })
                    .accessibilityAction {
                        viewModel.openExternalLink(model)
                    }
                    .accessibilityFocused($accessibilitySelected)
                    .accessibilityKey(.openInWikipedia)
                    .foregroundColor(DesignSystem.shared.colors.iconsTintColor)
                }
                .padding(DesignSystem.shared.spacer.small)
                .background(Color(DesignSystem.shared.colors.background))
                .cornerRadius(DesignSystem.shared.spacer.medium)
                .opacity(selected ? 1 : 0)
                Button("", systemImage: DesignSystem.shared.assets.mapPin, action: {
                    viewModel.toggleMarkerSelection(model)
                })
                .font(.title)
                .foregroundColor(model.type.pinColor)
                .accessibilityLabelFor(marker: model)
                .accessibilityAction {
                    viewModel.toggleMarkerSelection(model)
                }
            }
        }
        .onReceive(model.$selected, perform: { annotationSelected in
            selected = annotationSelected
            accessibilitySelected = annotationSelected
        })
    }
}

