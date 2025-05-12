//
//  ContentListViewModel.swift
//  SwiftUIApp
//
//  Created by Lev Iakimov on 09.03.2025.
//

import Foundation

final class ContentListViewModel: ObservableObject {
    @Published var selectedItem: UUID?
    
    let items: [ContentItem] = [
        .init(title: "Hello, World!"),
        .init(title: "Hello, Friend!"),
        .init(title: "Hello, Dude!"),
        .init(title: "Hello, Colleague!"),
        .init(title: "Bye!"),
    ]
}

extension ContentListViewModel {
    func selectRandomItem() {
        guard selectedItem == nil else { return }
        selectedItem = items.randomElement()?.id
    }
}
