//
//  ProductsInteractor.swift
//  ProductsSwiftUI
//
//  Created by Asad Mehmood on 23/12/2024.
//

import Foundation

protocol ProductsInteractor {
    func fetchProducts() async throws -> [ProductModel]
    func fetchProductComments() async throws -> [ProductCommentModel]
}

struct RealProductsInteractor: ProductsInteractor {
    
    private let webRepository: ProductsWebRepository
    
    init(webRepository: ProductsWebRepository) {
        self.webRepository = webRepository
    }
    
    func fetchProducts() async throws -> [ProductModel] {
        try await webRepository.fetchProductList().products
    }
    
    func fetchProductComments() async throws -> [ProductCommentModel] {
        try await webRepository.fetchProductComments().comments
    }
}

struct StubProductsInteractor: ProductsInteractor {
    
    func fetchProducts() async throws -> [ProductModel] { 
        []
    }
    func fetchProductComments() async throws -> [ProductCommentModel] { 
        []
    }
}
