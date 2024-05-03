//
//  NetworkError+errorMessage.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 03/05/2024.
//

import Foundation

extension NetworkError {
    public var errorMessage: String {
        switch self {
        case .badURL:
            AppStrings.noDataFoundMessage
        case .invalidData:
            AppStrings.corruptedData
        case .noInternetConnection:
            AppStrings.noInternetConnection
        case .unknownError:
            AppStrings.unknownError
        case .otherErrors(let error):
            error.localizedDescription
        }
    }
}
