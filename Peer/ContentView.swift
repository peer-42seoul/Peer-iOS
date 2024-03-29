//
//  ContentView.swift
//  Peer
//
//  Created by Hosung Lim on 2/26/24.
//

import SwiftUI

struct ContentView: View {

	@EnvironmentObject var post: PostListVM

    var body: some View {
		ZStack {
			if post.postListModel.loading {
				SplashView()
			} else {
				MainPageView()
			}
		}
		.task {
			await post.process(intent: .open)
		}
    }
}

#Preview {
    ContentView()
		.environmentObject(PostListVM())
}
