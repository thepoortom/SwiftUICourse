//
//  Session.swift
//  MultipeerApp
//
//  Created by Lev Iakimov on 31.05.2025.
//

import Combine
import MultipeerConnectivity
import os

struct PeerText {
    let peerID: MCPeerID
    let text: String
}

protocol TextMultipeerSession {
    var textPublisher: AnyPublisher<PeerText, Never> { get }
    var connectedPeersPublisher: AnyPublisher<[MCPeerID], Never> { get }
    func send(text: String)
}

final class TextMultipeerSessionImpl: NSObject, ObservableObject {
    private let serviceType = "text-peer"
    
    private let session: MCSession
    private let peerID = MCPeerID(displayName: UIDevice.current.name)
    private let serviceAdvertiser: MCNearbyServiceAdvertiser
    private let serviceBrowser: MCNearbyServiceBrowser
    private let log = Logger()
    
    private let textSubject = PassthroughSubject<PeerText, Never>()
    private let connectedPeersSubject = PassthroughSubject<[MCPeerID], Never>()
    
    // MARK: Life cycle
    override init() {
        self.session = MCSession(peer: peerID)
        self.serviceAdvertiser = MCNearbyServiceAdvertiser(
            peer: peerID,
            discoveryInfo: nil,
            serviceType: serviceType
        )
        self.serviceBrowser = MCNearbyServiceBrowser(
            peer: peerID,
            serviceType: serviceType
        )
        
        super.init()
        
        session.delegate = self
        serviceAdvertiser.delegate = self
        serviceBrowser.delegate = self
        
        serviceAdvertiser.startAdvertisingPeer()
        serviceBrowser.startBrowsingForPeers()
    }
    
    deinit {
        serviceAdvertiser.stopAdvertisingPeer()
        serviceBrowser.stopBrowsingForPeers()
    }
}

// MARK: - TextMultipeerSession
extension TextMultipeerSessionImpl: TextMultipeerSession {
    var textPublisher: AnyPublisher<PeerText, Never> {
        textSubject.eraseToAnyPublisher()
    }
    
    var connectedPeersPublisher: AnyPublisher<[MCPeerID], Never> {
        connectedPeersSubject.eraseToAnyPublisher()
    }
    
    func send(text: String) {
        log.info("Send text: '\(text)' to \(self.session.connectedPeers.count) peers")
        
        guard !session.connectedPeers.isEmpty else {
            return
        }
        
        let data = Data(text.utf8)
        do {
            try session.send(
                data,
                toPeers: session.connectedPeers,
                with: .reliable
            )
        } catch {
            log.error("Error for sending: \(String(describing: error))")
        }
    }
}

// MARK: - MCNearbyServiceAdvertiserDelegate
extension TextMultipeerSessionImpl: MCNearbyServiceAdvertiserDelegate {
    func advertiser(
        _ advertiser: MCNearbyServiceAdvertiser,
        didNotStartAdvertisingPeer error: Error
    ) {
        log.error("ServiceAdvertiser didNotStartAdvertisingPeer: \(String(describing: error))")
    }

    func advertiser(
        _ advertiser: MCNearbyServiceAdvertiser,
        didReceiveInvitationFromPeer peerID: MCPeerID,
        withContext context: Data?,
        invitationHandler: @escaping (Bool, MCSession?) -> Void
    ) {
        log.info("didReceiveInvitationFromPeer \(peerID)")
        invitationHandler(true, session)
    }
}

// MARK: - MCNearbyServiceBrowserDelegate
extension TextMultipeerSessionImpl: MCNearbyServiceBrowserDelegate {
    func browser(
        _ browser: MCNearbyServiceBrowser,
        didNotStartBrowsingForPeers error: Error
    ) {
        log.error("ServiceBrowser didNotStartBrowsingForPeers: \(String(describing: error))")
    }

    func browser(
        _ browser: MCNearbyServiceBrowser,
        foundPeer peerID: MCPeerID,
        withDiscoveryInfo info: [String: String]?
    ) {
        log.info("ServiceBrowser found peer: \(peerID)")
        browser.invitePeer(
            peerID,
            to: session,
            withContext: nil,
            timeout: 10
        )
    }

    func browser(
        _ browser: MCNearbyServiceBrowser,
        lostPeer peerID: MCPeerID
    ) {
        log.info("ServiceBrowser lost peer: \(peerID)")
    }
}

// MARK: - MCSessionDelegate
extension TextMultipeerSessionImpl: MCSessionDelegate {
    func session(
        _ session: MCSession,
        peer peerID: MCPeerID,
        didChange state: MCSessionState
    ) {
        log.info("peer \(peerID) didChangeState: \(state.rawValue)")
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.connectedPeersSubject.send(session.connectedPeers)
        }
    }

    func session(
        _ session: MCSession,
        didReceive data: Data,
        fromPeer peerID: MCPeerID
    ) {
        let text = String(decoding: data, as: UTF8.self)
        log.info("didReceive text '\(text)'")
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.textSubject.send(
                .init(
                    peerID: peerID,
                    text: text
                )
            )
        }
    }

    func session(
        _ session: MCSession,
        didReceive stream: InputStream,
        withName streamName: String,
        fromPeer peerID: MCPeerID
    ) {
        log.warning("Receiving streams is not supported")
    }

    func session(
        _ session: MCSession,
        didStartReceivingResourceWithName resourceName: String,
        fromPeer peerID: MCPeerID,
        with progress: Progress
    ) {
        log.warning("Receiving resources is not supported")
    }

    func session(
        _ session: MCSession,
        didFinishReceivingResourceWithName resourceName: String,
        fromPeer peerID: MCPeerID,
        at localURL: URL?,
        withError error: Error?
    ) {
        log.warning("Receiving resources is not supported")
    }
}
