//
//  Deal+Repository.swift
//  FavoriteFeature
//
//  Created by Lev Iakimov on 11.05.2025.
//

import Repository

extension Deal {
    init(entity: Repository.Deal) {
        id = entity.id
        title = entity.title
        gameID = entity.gameID
        salePrice = entity.salePrice
        normalPrice = entity.normalPrice
    }
}

extension Repository.Deal {
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
