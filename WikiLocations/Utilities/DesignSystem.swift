//
//  DesignSystem.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 03/05/2024.
//

import Foundation
import SwiftUI

class DesignSystem {
    class Spacer {
        var small: CGFloat = 5.0
        var medium: CGFloat = 10.0
    }

    class Assets {
        var openInWikiIconName: String {
            if UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft {
                return "rectangle.portrait.and.arrow.left"
            } else {
                return "rectangle.portrait.and.arrow.right"
            }
        }
        var mapPin: String = "mappin.circle.fill"
        var mapArrow: String = "arrowtriangle.down.fill"
        var customLocationDisabled: String = "mappin.slash"
        var customLocationEnabled: String = "mappin.and.ellipse"
        var refresh: String = "arrow.circlepath"
    }

    class Colors {
        func color(light: UIColor, dark: UIColor) -> Color {
            Color(UIColor { $0.userInterfaceStyle == .dark ? dark : light })
        }

        var primary: Color { color(light: .red, dark: .white.withAlphaComponent(0.7))}
        var secondary: Color { color(light: .green, dark: .lightGray)}
        var background: Color { color(light: .white, dark: .black.withAlphaComponent(0.9))}
        var iconsTintColor: Color  { color(light: .systemBlue, dark: .systemCyan)}
    }

    private init() {}

    public static let shared: DesignSystem = DesignSystem()
    public let spacer = Spacer()
    public let assets = Assets()
    public let colors = Colors()
}
