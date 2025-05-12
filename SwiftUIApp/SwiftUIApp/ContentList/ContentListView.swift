//
//  ContentListView.swift
//  SwiftUIApp
//
//  Created by Lev Iakimov on 05.03.2025.
//

import SwiftUI

struct ContentItem: Identifiable {
    let id: UUID = .init()
    let title: String
}

struct ContentListView: View {
    @StateObject var viewModel: ContentListViewModel
    
    var body: some View {
        NavigationView {
            List(Array(viewModel.items.enumerated()), id: \.offset) { index, item in
                NavigationLink(
                    destination: ItemDetailView(text: item.title),
                    tag: item.id,
                    selection: $viewModel.selectedItem
                ) {
                    Text("\(index + 1). \(item.title)")
                }
            }
            .navigationTitle("The List")
        }
    }
}

#Preview {
    ContentListView(viewModel: ContentListViewModel())
}
