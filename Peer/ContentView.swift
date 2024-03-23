//
//  ContentView.swift
//  Peer
//
//  Created by Hosung Lim on 2/26/24.
//

import SwiftUI

struct ContentView: View {

	@EnvironmentObject var postVM: PostVM

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
		.environmentObject(PostVM(networkProtocol: NetworkVM(networkModel: NetworkModel(APIurl: "https://" + (Bundle.main.infoDictionary?["API_URL"] as? String ?? "wrong")))))
}
