//
//  ProductListView.swift
//  ProductsSwiftUI
//
//  Created by Asad Mehmood on 23/12/2024.
//

import SwiftUI

struct ProductListView: View {
    
    @ObservedObject private var productViewModel: RealProductListViewModel
    
    init(productViewModel: RealProductListViewModel) {
        self.productViewModel = productViewModel
    }
    
    var body: some View {
        NavigationStack{
            
            if productViewModel.shouldShowLoader() {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                ProductListLayout(items: productViewModel.products)
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
