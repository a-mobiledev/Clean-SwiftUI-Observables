//
//  Models.swift
//  ProductsSwiftUI
//
//  Created by Asad Mehmood on 23/12/2024.
//

import Foundation

struct ProductListModel: Codable {
    let products: [ProductModel]
}
struct ProductModel: Codable, Hashable {
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
}

//extension ProductDataListDTO {
//    func toDomain() -> ProductDomainListDTO {
//        .init(productId: productId, title: title ?? "" , description: description ?? "", category: category ?? "", price: price ?? 0, thumbnail: thumbnail ?? "")
//    }
//}


struct ProductCommentsModel: Codable {
    let comments: [ProductCommentModel]
}
struct ProductCommentModel: Codable, Hashable {
    let id: Int
    let body: String
    let postId: Int
    let likes: Int
    let user: ProductCommentUserModel
}

struct ProductCommentUserModel: Codable, Hashable {
    let id: Int
    let username: String
    let fullName: String
}

//extension ProductDataCommentsDTO {
//    func toDomain() -> ProductDomainCommentsDTO {
//        .init(commentId: self.commentId, body: body, postId: postId, likes: likes, user: user)
//    }
//}
