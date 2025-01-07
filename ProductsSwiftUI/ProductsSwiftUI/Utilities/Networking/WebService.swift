//
//  DataTransferService.swift
//  ProductListing
//
//  Created by Asad Mehmood on 30/11/2024.
//


import Foundation

protocol WebService {
    var session: URLSession { get }
    var baseURL: String { get }
    var bgQueue: DispatchQueue { get }
}

extension WebService {

    func request<T>(request: NetworkRequest) async throws -> T where T : Decodable {
        
        let networkManager = DefaultNetworkManager(config: ApiDataNetworkConfig(baseURL: baseURL), sessionManager: DefaultNetworkSessionManager(session: session))
        let data = try await networkManager.fetch(request: request)
        return try decode(data: data)
    }
    
    /// Method to decode data using JSONDecoder
    /// - Parameter data: Data
    /// - Returns: Decodable type object
    func decode<T>(data: Data) throws -> T where T : Decodable {
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.unableToDecode
        }
    }
}
