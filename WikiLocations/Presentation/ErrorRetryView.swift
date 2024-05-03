//
//  ErrorRetryView.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 03/05/2024.
//

import SwiftUI

struct ErrorRetryView: View {
    let error: NetworkError
    let retryAction: () async -> Void

    var body: some View {
        VStack {
            Text(error.errorMessage)
                .padding()
            Spacer()
                .frame(height: DesignSystem.shared.bottomMargin)
            Button(AppStrings.retryErrorButton) {
                Task {
                    await retryAction()
                }
            }
        }
    }
}

