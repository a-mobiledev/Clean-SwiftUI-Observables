//
//  ProductViewModels.swift
//  ProductsSwiftUI
//
//  Created by Asad Mehmood on 23/12/2024.
//

import Foundation

protocol ProductListViewModel: ObservableObject {
    
    var products: [ProductModel] {get set}
    var isError: Bool {get}
    var error: String {get}
    var isEmpty: Bool {get}
    var title: String {get}
    
    func shouldShowLoader() -> Bool
    func fetchProducts() async
}

class RealProductListViewModel: ProductListViewModel {
    
    @Published var products: [ProductModel] = []
    @Published var isError: Bool = false
    @Published var error: String = ""
    var isEmpty: Bool { return products.isEmpty }
    var title: String = AppConstant.productListTitle
    private let productsInteractor: ProductsInteractor!

    init(productsInteractor: ProductsInteractor!) {
        self.productsInteractor = productsInteractor
    }
    
    @MainActor
    func fetchProducts() async {
        do {
            self.products = try await productsInteractor.fetchProducts()
            self.isError = false
        } catch {
            self.isError = true
            if let networkError = error as? NetworkError {
                self.error = networkError.description
            } else {
                self.error = error.localizedDescription
            }
        }
    }
    
    func shouldShowLoader() -> Bool {
        self.products.isEmpty && !isError
    }
}


protocol ProductCommentsViewModel: ObservableObject {
    
    var comments: [ProductCommentModel] {get set}
    var isError: Bool {get}
    var error: String {get}
    var isEmpty: Bool {get}
    
    func shouldShowLoader() -> Bool
    func fetchComments() async
}

class RealProductCommentsViewModel: ProductCommentsViewModel {
    @Published var comments: [ProductCommentModel] = []
    @Published var isError: Bool = false
    @Published var error: String = ""
    var isEmpty: Bool { return comments.isEmpty }
    private let productInteractor: ProductsInteractor!
    
    init(productInteractor: ProductsInteractor) {
        self.productInteractor = productInteractor
    }
    
    
    func fetchComments() async {
        do {
            self.comments = try await productInteractor.fetchProductComments()
            self.isError = false
        } catch {
            self.isError = true
            if let networkError = error as? NetworkError {
                self.error = networkError.description
            } else {
                self.error = error.localizedDescription
            }
        }
    }
    
    func shouldShowLoader() -> Bool {
        self.comments.isEmpty && !isError
    }
}
    
    
    
    
    
    
    
    
    
    
    
