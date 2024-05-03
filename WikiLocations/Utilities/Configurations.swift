//
//  Configurations.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 03/05/2024.
//

import Foundation

class Configurations {
    public static let shared = Configurations()
    lazy var endPoint: String? = {
        return "https://raw.githubusercontent.com"
    }()
}
