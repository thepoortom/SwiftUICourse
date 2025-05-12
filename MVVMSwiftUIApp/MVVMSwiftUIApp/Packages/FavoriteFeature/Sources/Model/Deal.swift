//
//  Deal.swift
//  FavoriteFeature
//
//  Created by Lev Iakimov on 11.05.2025.
//

struct Deal {
    let id: String
    let title: String
    let gameID: String
    let salePrice: String
    let normalPrice: String
}

extension Deal: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Deal {
    static var sample: Self {
        .init(
            id: "HhzMJAgQYGZ%2B%2BFPpBG%2BRFcuUQZJO3KXvlnyYYGwGUfU%3D",
            title: "Deus Ex: Human Revolution - Director's Cut",
            gameID: "102249",
            salePrice: "2.99",
            normalPrice: "19.99"
        )
    }
}
