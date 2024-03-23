//
//  PeerApp.swift
//  Peer
//
//  Created by Hosung Lim on 2/26/24.
//

import SwiftUI

@main
struct PeerApp: App {

	let network = NetworkVM(networkModel: NetworkModel(APIurl: "https://" + (Bundle.main.infoDictionary?["API_URL"] as? String ?? "wrong")))

    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(PostVM(networkProtocol: network))
        }
    }
}
