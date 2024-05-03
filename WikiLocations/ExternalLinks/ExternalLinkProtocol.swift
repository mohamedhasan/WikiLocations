//
//  ExternalLinkProtocol.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 04/05/2024.
//

import Foundation

protocol ExternalLinkProtocol {
    var schema: String { set get }
    var host: String { set get }
    func url(for location: LocationPresentable) -> URL?
}
