//
//  ProductsWebRepository.swift
//  ProductsSwiftUI
//
//  Created by Asad Mehmood on 23/12/2024.
//

import Foundation

protocol ProductsWebRepository: WebService {
    func fetchProductList() async throws -> [ProductModel]
    func fetchProductComments() async throws -> [ProductCommentModel]
}

struct RealProductsWebRepository: ProductsWebRepository {
    
    var session: URLSession
    var baseURL: String
    var bgQueue = DispatchQueue(label: "bg_parse_queue")
    
    init(session: URLSession, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }
    
    func fetchProductList() async throws -> [ProductModel] {
        let productListNetworkRequest = DefaultNetworkRequest(path: APIEndPoint.products, method: .get)
        return try await request(request: productListNetworkRequest)
    }
    
    func fetchProductComments() async throws -> [ProductCommentModel] {
        let productCommentsNetworkRequest = DefaultNetworkRequest(path: APIEndPoint.comments, method: .get)
        return try await request(request: productCommentsNetworkRequest)
    }
}

extension APIEndPoint {
    static let products = "/products"
    static let comments = "/comments"
}
