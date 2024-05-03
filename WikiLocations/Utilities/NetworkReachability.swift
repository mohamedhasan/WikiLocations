//
//  NetworkReachability.swift
//  WikiLocations
//
//  Created by Mohamed Hassan on 03/05/2024.
//

import Foundation
import Network

class NetworkReachability {

    public static let shared: NetworkReachability = NetworkReachability()

    private var pathMonitor: NWPathMonitor!
    private var path: NWPath?
    private lazy var pathUpdateHandler: ((NWPath) -> Void) = { path in
        self.path = path
    }

    private let backgroudQueue = DispatchQueue.global(qos: .background)

    private init() {
        pathMonitor = NWPathMonitor()
        pathMonitor.pathUpdateHandler = self.pathUpdateHandler
        pathMonitor.start(queue: backgroudQueue)
    }

    public var networkAvailable: Bool {
        if let path = self.path {
            if path.status == NWPath.Status.satisfied {
                return true
            }
        }
        return false
    }
}
