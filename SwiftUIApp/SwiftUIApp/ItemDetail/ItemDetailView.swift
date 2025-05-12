//
//  ItemDetailView.swift
//  SwiftUIApp
//
//  Created by Lev Iakimov on 09.03.2025.
//

import SwiftUI

struct ItemDetailView: View {
    var text: String
    
    var body: some View {
        VStack(spacing: 10) {
            TextInputUIKitView(text: text)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    maxHeight: 24
                )
                .cornerRadius(4)
                .padding()
            Spacer()
        }
    }
}

#Preview {
    ItemDetailView(text: "Some text")
}
