//
//  FavoriteListView.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 20.04.2025.
//

import SwiftUI
import UIComponents

public struct FavoriteListView: View {
    @StateObject
    private var viewModel: FavoriteListViewModel
    
    public init(viewModel: FavoriteListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        NavigationView {
            VStack {
                switch viewModel.state {
                case .empty:
                    Text("Nothing to show")
                case let .list(deals):
                    List(deals) { deal in
                        DealItemView(deal: deal)
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavoriteListView(
        viewModel: FavoriteListViewModel(
            dealRepository: DealRepositoryMock(),
            favoriteRepository: FavoriteRepositoryMock()
        )
    )
}
