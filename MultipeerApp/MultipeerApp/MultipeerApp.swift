//
//  MultipeerApp.swift
//  MultipeerApp
//
//  Created by Lev Iakimov on 31.05.2025.
//

import SwiftUI

@main
struct MultipeerApp: App {
    var body: some Scene {
        WindowGroup {
#if targetEnvironment(simulator)
            ChatView(viewModel: SimulatorChatViewModel())
#else
            ChatView(viewModel: DeviceChatViewModel(textMultipeerSession: TextMultipeerSessionImpl()))
#endif
        }
    }
}
