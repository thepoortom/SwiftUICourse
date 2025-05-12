//
//  MVVMSwiftUIApp.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 20.04.2025.
//

import Network
import Repository
import SwiftUI

@main
struct MVVMSwiftUIApp: App {
    private let dependencyContainer: DependencyContainer = {
        .init(
            dealNetworkService: DealNetworkServiceImpl(
                baseURL: Configuration.current.baseURL + Configuration.current.apiVersion
            ),
            dealRepository: InMemoryDealRepository(),
            favoriteRepository: InMemoryFavoriteRepository()
        )
    }()
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(dependencyContainer)
        }
    }
}
