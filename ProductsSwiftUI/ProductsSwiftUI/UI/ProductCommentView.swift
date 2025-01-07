//
//  ProductCommentView.swift
//  ProductsSwiftUI
//
//  Created by Asad Mehmood on 23/12/2024.
//

import SwiftUI

struct ProductCommentView: View {
    let comment: ProductCommentModel
    
    var body: some View {
        let theme = Theme.allCases.randomElement()!
        ZStack {
            VStack(alignment: .leading) {
                Text(comment.user.fullName)
                    .font(.headline)
                    .foregroundStyle(theme.accentColor)
                Text(comment.body)
                    .font(.body)
                    .foregroundStyle(theme.accentColor)
                Label("\(comment.likes)", systemImage: comment.likes == 0 ? "hand.thumbsup" : "hand.thumbsup.fill")
                    .foregroundStyle(theme.accentColor)
                    .font(.caption)
            }
            .frame(width: 300, height: 150)
        }
        .background(theme.mainColor)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
}
