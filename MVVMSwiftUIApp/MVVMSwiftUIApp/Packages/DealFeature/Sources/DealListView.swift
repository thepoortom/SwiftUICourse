//
//  DealListView.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 20.04.2025.
//

import SwiftUI
import UIComponents

public struct DealListView: View {
    @StateObject
    private var viewModel: DealListViewModel
    
    public init(viewModel: DealListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        NavigationView {
            VStack {
                switch viewModel.state {
                case .empty:
                    EmptyView()
                case .fetchingData:
                    ProgressView()
                case .success:
                    List(viewModel.deals) { deal in
                        DealWithFavoriteItemView(deal: deal) {
                            Task {
                                await viewModel.toggleFavorite(for: deal)
                            }
                        }
                    }
                    .navigationTitle(viewModel.getStoreTitle())
                case let .failed(error):
                    Text("Error: '\(error.localizedDescription)'")
                }
            }
            .task {
                await viewModel.fetchDeals()
            }
        }
    }
}

#Preview {
    DealListView(
        viewModel: DealListViewModel(
            dealNetworkService: DealNetworkServiceMock(),
            dealRepository: DealRepositoryMock(),
            favoriteRepository: FavoriteRepositoryMock()
        )
    )
}
