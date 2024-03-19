//
//  ContentView.swift
//  Peer
//
//  Created by Hosung Lim on 2/26/24.
//

import SwiftUI

struct ContentView: View {

	@State var isSignIn = false

    var body: some View {
		ZStack {
			if !isSignIn {
				SplashView()
			} else {
				
			}
		}
		.task {
			
		}
    }
}

#Preview {
    ContentView()
}
