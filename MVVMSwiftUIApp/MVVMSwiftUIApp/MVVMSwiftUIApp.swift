//
//  MVVMSwiftUIApp.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 20.04.2025.
//

import Network
import Repository
import SwiftData
import SwiftUI

@main
struct MVVMSwiftUIApp: App {
    private let dependencyContainer: DependencyContainer = {
        .init(
            dealNetworkService: DealNetworkServiceImpl(
                baseURL: Configuration.current.baseURL + Configuration.current.apiVersion
            ),
            dealRepository: DependencyContainer.makeDealRepository(),
            favoriteRepository: DependencyContainer.makeFavoriteRepository()
        )
    }()
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(dependencyContainer)
        }
    }
}

private extension DependencyContainer {
    static func makeDealRepository() -> DealRepository {
        guard #available(iOS 17, *) else {
            return InMemoryDealRepository()
        }
        let configuration = ModelConfiguration("DealStore")
        guard let modelContainer = try? ModelContainer(
            for: DealModel.self,
            configurations: configuration
        ) else {
            return InMemoryDealRepository()
        }
        return SwiftDataDealRepository(modelContainer: modelContainer)
    }
    
    static func makeFavoriteRepository() -> FavoriteRepository {
        guard #available(iOS 17, *) else {
            return InMemoryFavoriteRepository()
        }
        let configuration = ModelConfiguration("FavoriteDealStore")
        guard let modelContainer = try? ModelContainer(
            for: FavoriteDealModel.self,
            configurations: configuration
        ) else {
            return InMemoryFavoriteRepository()
        }
        return SwiftDataFavoriteRepository(modelContainer: modelContainer)
    }
}
