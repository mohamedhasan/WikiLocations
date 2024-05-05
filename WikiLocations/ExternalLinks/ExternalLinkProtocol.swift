//
//  ExternalLinkProtocol.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 04/05/2024.
//

import Foundation

protocol ExternalLinkProtocol {
    var schema: String { get set }
    var host: String { get set }
    func url(for location: LocationPresentable) -> URL?
}
