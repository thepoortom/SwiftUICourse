//
//  DealItemViewModel.swift
//  UIComponents
//
//  Created by Lev Iakimov on 11.05.2025.
//

public struct DealItemViewModel: Identifiable {
    public let id: String
    public let title: String
    public let salePrice: String
    public let normalPrice: String
    
    // MARK: Life cycle
    public init(
        id: String,
        title: String,
        salePrice: String,
        normalPrice: String
    ) {
        self.id = id
        self.title = title
        self.salePrice = salePrice
        self.normalPrice = normalPrice
    }
}

extension DealItemViewModel {
    static var sample: Self {
        .init(
            id: "HhzMJAgQYGZ%2B%2BFPpBG%2BRFcuUQZJO3KXvlnyYYGwGUfU%3D",
            title: "Deus Ex: Human Revolution - Director's Cut",
            salePrice: "2.99",
            normalPrice: "19.99"
        )
    }
}
