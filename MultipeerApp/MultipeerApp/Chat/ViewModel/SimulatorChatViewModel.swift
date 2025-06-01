//
//  SimulatorChatViewModel.swift
//  MultipeerApp
//
//  Created by Lev Iakimov on 01.06.2025.
//

import Combine

/// A lightweight view model used only in the iOS Simulator environment.
/// This class simulates basic chat behavior to enable UI development and testing
/// without relying on MultipeerConnectivity, which is limited or unsupported in the simulator.
/// No actual peer-to-peer networking occurs; messages are looped back locally.
final class SimulatorChatViewModel: ObservableObject {
    private static let name = "Simulator"
    
    @Published
    var connectedPeers: [Peer] = [
        .init(name: name),
    ]
    
    @Published
    var messages: [Message] = []
    
    @Published
    var inputText: String = ""
}

// MARK: - ChatViewModel
extension SimulatorChatViewModel: ChatViewModel {
    func sendMessage() {
        guard !inputText.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        messages.append(
            .init(
                author: Self.name,
                text: inputText
            )
        )
        inputText = ""
    }
}
