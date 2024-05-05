//
//  AccessibilityWrapper.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 05/05/2024.
//

import Foundation

class AccessibilityWrapper {
    public static let shared = AccessibilityWrapper()

    private init() {}

    struct AccessibilitySettings {
        let id: String
        let label: String?
        let hint: String?
    }

    func values(_ key: AccessibilityKey) -> AccessibilitySettings {
        return switch key {
        case .progressView:
            AccessibilitySettings(id: "mainView.progressview", label: AppStrings.progressAccessibilityLabel, hint: nil)
        case .mapView:
            AccessibilitySettings(id: "mainView.mapView", label: AppStrings.mapViewAccessibilityLabel, hint: nil)
        case .errorRetryButton:
            AccessibilitySettings(
                id: "mainView.errorView.retryButton",
                label: nil,
                hint: AppStrings.errorRetryAccessibilityHint)
        case .headerCustomLocationEnabled(true):
            AccessibilitySettings(
                id: "mainView.header.addCustomLocation",
                label: nil,
                hint: AppStrings.addCustomLocationEnabledHint)
        case .headerCustomLocationEnabled(false):
            AccessibilitySettings(
                id: "mainView.header.addCustomLocation",
                label: nil,
                hint: AppStrings.addCustomLocationDisabledHint)
        case .headerRefresh:
            AccessibilitySettings(
                id: "mainView.header.refresh",
                label: nil,
                hint: AppStrings.headerRefreshHint)
        case .openInWikipedia:
            AccessibilitySettings(
                id: "mainView.mapView.pin.image",
                label: AppStrings.openInWikiHint,
                hint: nil)
        }
    }
}
