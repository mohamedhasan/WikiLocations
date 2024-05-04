//
//  MapHeader.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 04/05/2024.
//

import Foundation
import SwiftUI

struct MapHeader: View {
    @EnvironmentObject var viewModel: MapViewModel
    @State var customLocationEnabled: Bool = false

    var body: some View {
        HStack {
            Text(
                customLocationEnabled ?
                AppStrings.addLocationInstruction : AppStrings.tapToAddLocation
            )
            .font(.callout)
            Button("", systemImage: customLocationEnabled ? DesignSystem.shared.assets.customLocationEnabled : DesignSystem.shared.assets.customLocationDisabled, action: {
                viewModel.customLocationEnabled.toggle()
            })
        }.onTapGesture {
            viewModel.customLocationEnabled.toggle()
        }
        .padding(DesignSystem.shared.spacer.small)
        .background(Color(DesignSystem.shared.colors.background))
        .cornerRadius(DesignSystem.shared.spacer.medium)
        .opacity(0.7)
        .onReceive(viewModel.$customLocationEnabled, perform: { enabled in
            customLocationEnabled = enabled
        })
    }
}
