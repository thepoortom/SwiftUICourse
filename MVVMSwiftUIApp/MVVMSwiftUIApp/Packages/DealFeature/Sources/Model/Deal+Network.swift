//
//  Deal+Network.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 11.05.2025.
//

import Network

extension Deal {
    init(entity: Network.Deal) {
        id = entity.dealID
        title = entity.title
        gameID = entity.gameID
        salePrice = entity.salePrice
        normalPrice = entity.normalPrice
    }
}
