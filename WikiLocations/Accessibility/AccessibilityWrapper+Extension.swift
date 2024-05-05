//
//  AccessibilityWrapper+Extension.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 05/05/2024.
//

import Foundation

extension AccessibilityWrapper {
    public func accessibilityID(key: AccessibilityKey) -> String? {
        return values(key).id
    }

    public func accessibilityLabel(key: AccessibilityKey) -> String? {
        return values(key).label
    }

    public func accessibilityHint(key: AccessibilityKey) -> String? {
        return values(key).hint
    }
}
