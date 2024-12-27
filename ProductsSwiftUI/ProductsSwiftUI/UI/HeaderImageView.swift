//
//  HeaderImageView.swift
//  ProductsSwiftUI
//
//  Created by Asad Mehmood on 23/12/2024.
//

import SwiftUI
import Kingfisher

struct HeaderImageView: View {
    let urlString: String
    let height: CGFloat
    
    var body: some View {
        KFImage(URL(string: urlString))
            .placeholder {
                Rectangle().foregroundStyle(.gray)
            }
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .aspectRatio(120.0/63.0, contentMode: .fit)
            .presentationCornerRadius(4.0)
            .preferredColorScheme(.light)
    }
}
