//
//  MarkerModel.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 03/05/2024.
//

import Foundation
import SwiftUI

class MarkerModel: Identifiable, Equatable, ObservableObject {

    @Published var selected: Bool = false
    var location: LocationPresentable
    var id: String {
        "\(location.title ?? "")-\(location.coordinate.latitude)-\(location.coordinate.longitude)"
    }

    init(location: LocationPresentable) {
        self.location = location
    }

    static func == (lhs: MarkerModel, rhs: MarkerModel) -> Bool {
        return lhs.id == rhs.id
    }
}
