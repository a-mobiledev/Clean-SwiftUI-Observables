//
//  DIContainer.swift
//  ProductsSwiftUI
//
//  Created by Asad Mehmood on 23/12/2024.
//

import Foundation


struct DIContainer {

    static let shared = DIContainer()
    
    var session: URLSession
    var webRepositories: WebRepositoriesContainer
    var interactors: InteractorsContainer
    var viewModels: ViewModelsContainer
    
    private init() {
        self.session = DIContainer.configuredURLSession()
        webRepositories = DIContainer.configuredWebRepositories(session: session)
        interactors = DIContainer.configuredInteractors(webRepositories: webRepositories)
        viewModels = DIContainer.configuredViewModels(interactors: interactors)
    }
    
    private static func configuredURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 120
        configuration.waitsForConnectivity = true
        configuration.httpMaximumConnectionsPerHost = 5
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        return URLSession(configuration: configuration)
    }
    private static func configuredWebRepositories(session: URLSession) -> WebRepositoriesContainer {
        let productsWebRepository = RealProductsWebRepository(
            session: session,
            baseURL: "dummyjson.com")
        return WebRepositoriesContainer(productsRepository: productsWebRepository)
    }
    
    private static func configuredInteractors(webRepositories: WebRepositoriesContainer) -> InteractorsContainer {
        let productsInteractor = RealProductsInteractor(
            webRepository: webRepositories.productsRepository)
        return InteractorsContainer(productsInteractor: productsInteractor)
    }
    
    private static func configuredViewModels(interactors: InteractorsContainer) -> ViewModelsContainer {
        let productsViewModel = RealProductListViewModel(productsInteractor: interactors.productsInteractor)
        let productCommentsViewModel = RealProductCommentsViewModel(productInteractor: interactors.productsInteractor)
        return ViewModelsContainer(productsViewModel: productsViewModel, productCommentsViewModel: productCommentsViewModel)
    }
}

extension DIContainer {
    struct WebRepositoriesContainer {
        let productsRepository: ProductsWebRepository
    }
    
    struct InteractorsContainer {
        let productsInteractor: ProductsInteractor
    }
    
    struct ViewModelsContainer {
        let productsViewModel: any ProductListViewModel
        let productCommentsViewModel: any ProductCommentsViewModel
    }
}

