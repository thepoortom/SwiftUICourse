//
//  Deal.swift
//  Repository
//
//  Created by Lev Iakimov on 11.05.2025.
//

public struct Deal {
    public let id: String
    public let title: String
    public let gameID: String
    public let salePrice: String
    public let normalPrice: String
    
    public init(
        id: String,
        title: String,
        gameID: String,
        salePrice: String,
        normalPrice: String
    ) {
        self.id = id
        self.title = title
        self.gameID = gameID
        self.salePrice = salePrice
        self.normalPrice = normalPrice
    }
}
