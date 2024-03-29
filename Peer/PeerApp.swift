//
//  PeerApp.swift
//  Peer
//
//  Created by Hosung Lim on 2/26/24.
//

import SwiftUI

@main
struct PeerApp: App {

	@StateObject var post = PostListVM()

    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(post)
        }
    }
}
