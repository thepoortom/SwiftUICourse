//
//  DealStore.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 27.04.2025.
//

struct DealStore {
    let id: Int
    let title: String
}

extension DealStore {
    static var steam: Self {
        .init(
            id: 1,
            title: "Steam"
        )
    }
}
