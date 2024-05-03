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
    }
    private init() {}

    public static let shared: DesignSystem = DesignSystem()
    public let spacer = Spacer()
    public let assets = Assets()
}
