//
//  DealItemView.swift
//  UIComponents
//
//  Created by Lev Iakimov on 11.05.2025.
//

import SwiftUI

public struct DealItemView: View {
    private let deal: DealItemViewModel
    
    public init(deal: DealItemViewModel) {
        self.deal = deal
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(deal.title)
                .font(.headline)
                .foregroundColor(.primary)
            
            HStack(alignment: .lastTextBaseline) {
                Text(deal.salePrice)
                    .font(.body)
                    .foregroundColor(.primary)
                    .padding(.init(top: 4, leading: 8, bottom: 4, trailing: 8))
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(8)
                Text(deal.normalPrice)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .strikethrough(true, color: .secondary)
            }
        }
    }
}

#Preview {
    DealItemView(
        deal: .sample
    )
}
