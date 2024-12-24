//
//  ProductListLayout.swift
//  ProductsSwiftUI
//
//  Created by Asad Mehmood on 23/12/2024.
//

import SwiftUI

struct ProductListLayout: View {
    
    let items: [ProductModel]
    let columns = [GridItem(.adaptive(minimum: 120), spacing: 20)]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(items, id: \.id) { item in
                    NavigationLink(value: item) {
                        ProductListItemView(item: item)
                    }
                }
            }
            .padding(20)
        }
        .navigationDestination(for: ProductModel.self) { item in
            ProductDetailView(item: item, productCommentsViewModel: DIContainer.shared.viewModels.productCommentsViewModel as! RealProductCommentsViewModel)
        }
    }
}

