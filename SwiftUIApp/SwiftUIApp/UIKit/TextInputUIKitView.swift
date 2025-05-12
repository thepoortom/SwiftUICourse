//
//  TextInputUIKitView.swift
//  SwiftUIApp
//
//  Created by Lev Iakimov on 09.03.2025.
//

import SwiftUI

struct TextInputUIKitView: UIViewRepresentable {
    var text: String

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.backgroundColor = .systemGray5
        return textField
    }

    func updateUIView(
        _ uiView: UITextField,
        context: Context
    ) {
        uiView.text = text
    }
}
