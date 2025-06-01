//
//  ChatView.swift
//  MultipeerApp
//
//  Created by Lev Iakimov on 31.05.2025.
//

import MultipeerConnectivity
import SwiftUI

struct ChatView<ViewModel: ChatViewModel>: View {
    @StateObject
    private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Section(header: Text("Connected Peers").font(.headline)) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        if viewModel.connectedPeers.isEmpty {
                            Text("No peers connected")
                                .foregroundColor(.gray)
                                .italic()
                        } else {
                            ForEach(viewModel.connectedPeers) { peer in
                                Text(peer.name)
                                    .padding()
                                    .background(Color.blue.opacity(0.2))
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 60)
            }
            
            Section(header: Text("Chat").font(.headline)) {
                List(viewModel.messages) { message in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(message.author)
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text(message.text)
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.vertical, 4)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    .background(.clear)
                }
                .listStyle(PlainListStyle())
                .background(Color.gray.opacity(0.2))
            }
            
            HStack {
                TextField("Enter message", text: $viewModel.inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Send") {
                    viewModel.sendMessage()
                }
                .padding(.leading, 8)
            }
            .padding()
        }
    }
}

#Preview {
    ChatView(viewModel: SimulatorChatViewModel())
}
