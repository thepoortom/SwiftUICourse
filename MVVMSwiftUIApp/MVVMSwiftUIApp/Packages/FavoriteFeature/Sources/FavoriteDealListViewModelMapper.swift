//
//  FavoriteDealListViewModelMapper.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 10.05.2025.
//

import UIComponents

final class FavoriteDealListViewModelMapper {
}

extension FavoriteDealListViewModelMapper {
    func makeViewModels(for deals: [Deal]) -> [DealItemViewModel] {
        deals.map {
            .init(
                id: $0.id,
                title: $0.title,
                salePrice: $0.salePrice,
                normalPrice: $0.normalPrice
            )
        }
    }
}
