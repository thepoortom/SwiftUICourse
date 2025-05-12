//
//  ModalActionButtonView.swift
//  SwiftUIApp
//
//  Created by Lev Iakimov on 05.03.2025.
//

import SwiftUI

struct ModalActionButtonView: View {
    @State private var isAlertPresented = false
    
    var body: some View {
        Button("Show Alert") {
            isAlertPresented = true
        }
        .alert("Important Alert", isPresented: $isAlertPresented) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Some kind of hint or warning")
        }
    }
}

#Preview {
    ModalActionButtonView()
}
