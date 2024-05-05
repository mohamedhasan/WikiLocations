//
//  View+Accessibility.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 05/05/2024.
//

import Foundation
import SwiftUI

extension View {

    func accessibilityKey(_ key: AccessibilityKey) -> AnyView {
        var view: AnyView = AnyView(self)
        if let id = AccessibilityWrapper.shared.accessibilityID(key: key) {
            view = AnyView(accessibilityIdentifier(id))
        }
        if let label = AccessibilityWrapper.shared.accessibilityLabel(key: key) {
            view = AnyView(accessibilityLabel(label))
        }
        if let hint = AccessibilityWrapper.shared.accessibilityHint(key: key) {
            view = AnyView(accessibilityHint(hint))
        }
        return view
    }

    func accessibilityLabelFor(marker: MarkerModel) -> AnyView {
        var view: AnyView = AnyView(self)
        view = AnyView(accessibilityIdentifier(marker.id))
        var label = "Map pin for latitude \(marker.location.coordinate.latitude) and longitude \(marker.location.coordinate.longitude)"
        if let title = marker.location.title {
            label += "and named \(title)"
        }
        view = AnyView(accessibilityLabel(label))
        return view
    }
}
