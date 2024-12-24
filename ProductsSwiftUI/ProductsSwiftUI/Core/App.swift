//
//  ProductsSwiftUIApp.swift
//  ProductsSwiftUI
//
//  Created by Asad Mehmood on 21/12/2024.
//

import SwiftUI

@main
struct MainApp: App {
    
    var body: some Scene {
        WindowGroup {
            ProductListView(productViewModel: DIContainer.shared.viewModels.productsViewModel as! RealProductListViewModel)
        }
    }
}
