//
//  ProductListLayout.swift
//  ProductsSwiftUI
//
//  Created by Asad Mehmood on 23/12/2024.
//

import SwiftUI

struct ProductListLayout: View {
    
    let products: [ProductModel]
    let columns = [GridItem(.adaptive(minimum: 120), spacing: 20)]
    @State private var productCommentsViewModel = DIContainer.shared.viewModels.productCommentsViewModel as! RealProductCommentsViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(products, id: \.id) { product in
                    
                    NavigationLink {
                        ProductDetailView(product: product)
                            .environment(productCommentsViewModel)
                    } label: {
                        ProductListItemView(item: product)
                    }
                }
            }
            .padding(20)
        }
    }
}
