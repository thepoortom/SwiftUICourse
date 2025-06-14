//
//  FavoriteDealModel.swift
//  Repository
//
//  Created by Lev Iakimov on 14.06.2025.
//

import SwiftData

@available(iOS 17, *)
@Model
public final class FavoriteDealModel {
    @Attribute(.unique)
    private(set) var dealID: String
    
    init(dealID: String) {
        self.dealID = dealID
    }
}
