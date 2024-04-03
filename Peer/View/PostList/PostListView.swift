//
//  PostListView.swift
//  Peer
//
//  Created by Hosung Lim on 3/18/24.
//

import SwiftUI

struct PostListView: View {
	@EnvironmentObject var post: PostListVM

	var body: some View {
		NavigationStack {
			ZStack {
				Color("PrimaryBackground")
					.ignoresSafeArea()
				VStack {
					// HEADER
					PostListHeader()
					// filter
					PostListFilterView()
					// BODY
					PostListBody()
				}
			}
			.onAppear {
				Task {
					await post.process(intent: .open)
				}
			}
		}
	}
}

#Preview {
	PostListView()
		.environmentObject(PostListVM())
}
