//
//  ProductsWebRepository.swift
//  ProductsSwiftUI
//
//  Created by Asad Mehmood on 23/12/2024.
//

import Foundation

protocol ProductsWebRepository: WebService {
    func fetchProductList() async throws -> ProductListModel
    func fetchProductComments() async throws -> ProductCommentsModel
}

struct RealProductsWebRepository: ProductsWebRepository {
    
    var session: URLSession
    var baseURL: String
    var bgQueue = DispatchQueue(label: "bg_parse_queue")
    
    init(session: URLSession, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }
    
    func fetchProductList() async throws -> ProductListModel {
        let productListNetworkRequest = DefaultNetworkRequest(path: APIEndPoint.products, method: .get)
        return try await request(request: productListNetworkRequest)
        
    }
    
    func fetchProductComments() async throws -> ProductCommentsModel {
        let productCommentsNetworkRequest = DefaultNetworkRequest(path: APIEndPoint.comments, method: .get)
        return try await request(request: productCommentsNetworkRequest)
    }
}

extension APIEndPoint {
    static let products = "/products"
    static let comments = "/comments"
}
