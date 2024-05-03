//
//  WikiExternalLink.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 04/05/2024.
//

import Foundation

class WikiExternalLink: ExternalLinkProtocol {
    var schema: String = "wikipedia"
    var host: String = "location"

    func url(for location: LocationPresentable) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = schema
        urlComponents.host = host
        var queryItems = [
            URLQueryItem(name: "latitude", value: "\(location.coordinate.latitude)"),
            URLQueryItem(name: "longitude", value: "\(location.coordinate.longitude)")
        ]
        if let name = location.title {
            queryItems.append(URLQueryItem(name: "name", value: name))
        }
        urlComponents.queryItems = queryItems
        return urlComponents.url
    }
}
