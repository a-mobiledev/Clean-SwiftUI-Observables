//
//  ProductDetailView.swift
//  ProductsSwiftUI
//
//  Created by Asad Mehmood on 23/12/2024.
//

import SwiftUI
import Kingfisher

struct ProductDetailView: View {
    var product: ProductModel
    @Environment(RealProductCommentsViewModel.self) private var productCommentsViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderImageView(urlString: product.thumbnail ?? "", height: 150)
            Text(product.title ?? "").font(.title)
            HStack{
                Text("\(product.price ?? 0.0)")
                    .foregroundStyle(.red)
                    .font(.title2)
                Button {
                    product.isFavourite = !product.isFavourite
                } label: {
                    Image(systemName: product.isFavourite == true ? "star.fill" : "star")
                        .foregroundStyle(.yellow)
                }
            }
            Spacer(minLength: 20)
            if productCommentsViewModel.shouldShowLoader() {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                Text("Reviews")
                    .padding(.leading, 10)
                    .font(.headline)
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(productCommentsViewModel.comments, id: \.id) { comment in
                            ProductCommentView(comment: comment)
                                .padding(5)
                        }
                        .listStyle(.plain)
                    }
                }
            }
        }
        .preferredColorScheme(.light)
        .task {
            await fetchComments()
        }
    }
    
    private func fetchComments() async {
        await productCommentsViewModel.fetchComments()
        
    }
}
