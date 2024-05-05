//
//  AccessibilityWrapper.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 05/05/2024.
//

import Foundation

import Foundation

class AccessibilityWrapper {
    public static let shared = AccessibilityWrapper()

    private init() {}
    
    func values(_ key: AccessibilityKey) -> (id: String, label: String?, hint: String?) {
        return switch key {
        case .progressView:
            (id: "mainView.progressview", label: AppStrings.progressAccessibilityLabel, hint: nil)
        case .mapView:
            (id: "mainView.mapView", label: AppStrings.mapViewAccessibilityLabel, hint: nil)
        case .errorRetryButton:
            (id: "mainView.errorView.retryButton", label: nil, hint: AppStrings.errorRetryAccessibilityHint)
        case .headerCustomLocationEnabled(true):
            (id: "mainView.header.addCustomLocation", label: nil, hint: AppStrings.addCustomLocationEnabledHint)
        case .headerCustomLocationEnabled(false):
            (id: "mainView.header.addCustomLocation", label: nil, hint: AppStrings.addCustomLocationDisabledHint)
        case .headerRefresh:
            (id: "mainView.header.refresh", label: nil, hint: AppStrings.headerRefreshHint)
        case .openInWikipedia:
            (id: "mainView.mapView.pin.image", label: AppStrings.openInWikiHint, hint: nil)
        }
    }
}
