//
//  Models.swift
//  ProductsSwiftUI
//
//  Created by Asad Mehmood on 23/12/2024.
//

import Foundation

// Product Listing
@Observable
class ProductListModel: Codable, Identifiable {
    let products: [ProductModel]
}
@Observable
class ProductModel: Codable, Identifiable {
    let id: Int
    let title: String?
    let description: String?
    let price: Double?
    let discountPercentage: Double?
    let rating: Double?
    let stock: Int?
    let brand: String?
    let category: String?
    let thumbnail: String?
    let images: [String]?
    
    var isFavourite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case price
        case discountPercentage
        case rating
        case stock
        case brand
        case category
        case thumbnail
        case images
    }
}

// Product Comments
@Observable
class ProductCommentsModel: Codable, Identifiable {
    let comments: [ProductCommentModel]
}
@Observable
class ProductCommentModel: Codable, Identifiable {
    let id: Int
    let body: String
    let postId: Int
    let likes: Int
    let user: ProductCommentUserModel
}

@Observable
class ProductCommentUserModel: Codable, Identifiable {
    let id: Int
    let username: String
    let fullName: String
}
