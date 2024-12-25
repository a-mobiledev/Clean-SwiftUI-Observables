//
//  ProductDetailView.swift
//  ProductsSwiftUI
//
//  Created by Asad Mehmood on 23/12/2024.
//

import SwiftUI
import Kingfisher

struct ProductDetailView: View {
    var item: ProductModel
    
    @ObservedObject private var productCommentsViewModel: RealProductCommentsViewModel
    
    init(item: ProductModel, productCommentsViewModel: RealProductCommentsViewModel) {
        self.item = item
        self.productCommentsViewModel = productCommentsViewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderImageView(urlString: item.thumbnail ?? "", height: 150)
            Text(item.title ?? "").font(.title)
            HStack{
                Text("\(item.price ?? 0.0)")
                    .foregroundStyle(.red)
                    .font(.title2)
//                    .overlay {
//                        Button {
//                            item.isFavourite = !item.isFavourite
//                        } label: {
//                            Image(systemName: item.isFavourite == true ? "star.fill" : "star")
//                                .foregroundStyle(.yellow)
//                        }
//
//                    }
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
