//
//  OnboardingView.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 20.04.2025.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var hasSeenOnboarding: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Text("[CheapShark API](https://apidocs.cheapshark.com)")
                Text("Use this API to get the latest deals on video games")
                    .multilineTextAlignment(.center)
                    .padding(.top, 2)
                    .padding([.leading, .trailing, .bottom])
            }
            .navigationBarItems(trailing: Button("Done") {
                hasSeenOnboarding = true
                dismiss()
            })
        }
    }
}

#Preview {
    OnboardingView(hasSeenOnboarding: .constant(false))
}
