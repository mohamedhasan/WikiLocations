//
//  NetworkError.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 03/05/2024.
//

import Foundation

import Foundation

enum NetworkError: Error, Equatable {
    static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        lhs.errorMessage == rhs.errorMessage
    }
    
    case badURL
    case invalidData
    case noInternetConnection
    case otherErrors(Error)
    case unknownError
    case noLocationsFound
}
