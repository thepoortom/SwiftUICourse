//
//  DeviceChatViewModel.swift
//  MultipeerApp
//
//  Created by Lev Iakimov on 01.06.2025.
//

import Combine
import Foundation

final class DeviceChatViewModel: ObservableObject {
    private let textMultipeerSession: TextMultipeerSession
    private var cancellables = Set<AnyCancellable>()
    
    @Published
    var connectedPeers: [Peer] = []
    
    @Published
    var messages: [Message] = []
    
    @Published
    var inputText: String = ""
    
    // MARK: Life cycle
    init(textMultipeerSession: TextMultipeerSession) {
        self.textMultipeerSession = textMultipeerSession
        setupBindings()
    }
}

private extension DeviceChatViewModel {
    func setupBindings() {
        textMultipeerSession.textPublisher
            .map { peerText in
                Message(
                    author: peerText.peerID.displayName,
                    text: peerText.text
                )
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] message in
                guard let self else { return }
                self.messages.append(message)
            }
            .store(in: &cancellables)
        
        textMultipeerSession.connectedPeersPublisher
            .map { peers in
                peers.map {
                    Peer(name: $0.displayName)
                }
            }
            .receive(on: DispatchQueue.main)
            .assign(to: &$connectedPeers)
    }
}

// MARK: - ChatViewModel
extension DeviceChatViewModel: ChatViewModel {
    func sendMessage() {
        guard !inputText.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        messages.append(
            Message(
                author: "Me",
                text: inputText
            )
        )
        textMultipeerSession.send(text: inputText)
        inputText = ""
    }
}
