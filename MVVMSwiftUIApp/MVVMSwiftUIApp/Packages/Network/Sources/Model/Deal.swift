//
//  Deal.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 20.04.2025.
//

public struct Deal: Decodable {
    public let dealID: String
    public let title: String
    public let gameID: String
    public let salePrice: String
    public let normalPrice: String
}
