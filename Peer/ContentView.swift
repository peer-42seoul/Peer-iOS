//
//  ContentView.swift
//  Peer
//
//  Created by Hosung Lim on 2/26/24.
//

import SwiftUI

struct ContentView: View {
	@EnvironmentObject var post: PostListVM
	@State var isShow: Bool = false

	var body: some View {
		ZStack {
			if isShow {
				MainPageView()
			} else {
				SplashView()
					.onAppear {
						DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
							isShow = true
						}
					}
			}
		}
	}
}

#Preview {
	ContentView()
		.environmentObject(PostListVM())
		.environmentObject(ShowcaseVM())
}
