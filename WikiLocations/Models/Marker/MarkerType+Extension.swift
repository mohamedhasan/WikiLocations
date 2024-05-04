//
//  MarkerType+Extension.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 04/05/2024.
//

import Foundation
import SwiftUI

extension MarkerType {
    var pinColor: Color {
        switch self {
        case .locationMarker:
            return DesignSystem.shared.colors.primary
        case .userDefined:
            return DesignSystem.shared.colors.secondary
        }
    }
}
