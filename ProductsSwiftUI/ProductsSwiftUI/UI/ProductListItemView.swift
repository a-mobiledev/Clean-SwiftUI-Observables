//
//  ProductListItemView.swift
//  ProductsSwiftUI
//
//  Created by Asad Mehmood on 23/12/2024.
//

import SwiftUI

struct ProductListItemView: View {
    var item: ProductModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderImageView(urlString: item.thumbnail ?? "", height: 150)
            Text(item.title ?? "").font(.title)
            Text("\(item.price ?? 0.0)")
                .foregroundStyle(.red)
                .font(.title2)
        }
        .preferredColorScheme(.light)
    }
}
