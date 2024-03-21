//
//  ContentView.swift
//  Peer
//
//  Created by Hosung Lim on 2/26/24.
//

import SwiftUI

struct ContentView: View {

	@StateObject postVM: PostVM = PostVM(networkProtocol: )

    var body: some View {
		ZStack {
			SplashView()
		}
		.task {
			await postVM.process(intent: .open)
		}
    }
}

#Preview {
    ContentView()
		.environmentObject()
}
