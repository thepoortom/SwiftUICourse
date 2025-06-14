//
//  DealModel.swift
//  Repository
//
//  Created by Lev Iakimov on 14.06.2025.
//

import SwiftData

@available(iOS 17, *)
@Model
public final class DealModel {
    @Attribute(.unique)
    private(set) var identifier: String
    private(set) var title: String
    private(set) var gameID: String
    private(set) var salePrice: String
    private(set) var normalPrice: String
    
    init(
        id: String,
        title: String,
        gameID: String,
        salePrice: String,
        normalPrice: String
    ) {
        self.identifier = id
        self.title = title
        self.gameID = gameID
        self.salePrice = salePrice
        self.normalPrice = normalPrice
    }
}
