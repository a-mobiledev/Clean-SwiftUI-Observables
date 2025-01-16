//
//  NetworkPublisher.swift
//  ProductsSwiftUI
//
//  Created by Asad Mehmood on 16/01/2025.
//

import Foundation
import Network

class NetworkPublisher {
    private var monitor: NWPathMonitor
    private var queue: DispatchQueue
    private var listeners: [(Bool) -> Void] = []
    
    init() {
        monitor = NWPathMonitor()
        queue = DispatchQueue(label: "NetworkPublisherQueue")
        
        monitor.pathUpdateHandler = { [weak self] path in
            let isConnected = (path.status == .satisfied)
            self?.notifyListeners(isConnected: isConnected)
        }
        monitor.start(queue: queue)
    }
    
    func subscribe(_ listener: @escaping (Bool) -> Void) {
        listeners.append(listener)
    }
    
    private func notifyListeners(isConnected: Bool) {
        DispatchQueue.main.async {
            for listener in self.listeners {
                listener(isConnected)
            }
        }
    }
    
    deinit {
        monitor.cancel()
    }
}
