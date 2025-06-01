//
//  ChatViewModel.swift
//  MultipeerApp
//
//  Created by Lev Iakimov on 01.06.2025.
//

import Combine

protocol ChatViewModel: ObservableObject, AnyObject {
    var connectedPeers: [Peer] { get }
    var messages: [Message] { get }
    var inputText: String { get set }
    
    func sendMessage()
}
