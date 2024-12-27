//
//  ProductListView.swift
//  ProductsSwiftUI
//
//  Created by Asad Mehmood on 23/12/2024.
//

import SwiftUI

struct ProductListView: View {
    
    @Environment(RealProductListViewModel.self) private var productViewModel
    
    var body: some View {
        NavigationStack{
            
            if productViewModel.shouldShowLoader() {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                ProductListLayout(products: productViewModel.products)
                    .overlay {
                        if productViewModel.isError {
                            ErrorView(errorTitle: AppConstant.errorTitle, errorDescription: productViewModel.error) {
                                Task {
                                    await fetchProducts()
                                }
                            }
                        }
                    }
                .navigationTitle(AppConstant.productListTitle)
                .navigationBarTitleDisplayMode(.large)
            }
        }
        .task {
            await fetchProducts()
        }
    }
    
    private func fetchProducts() async {
        await productViewModel.fetchProducts()
    }
}
