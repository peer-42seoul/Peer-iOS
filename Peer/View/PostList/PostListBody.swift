//
//  MainBodyView.swift
//  Peer
//
//  Created by Hosung Lim on 3/29/24.
//

import SwiftUI

struct PostListBody: View {
	@EnvironmentObject var postVm: PostListVM

	var body: some View {
		ScrollView {
			LazyVStack(spacing: 20) {
				ForEach(postVm.postListModel.posts, id: \.title) { post in
					PostListCard(post: post)
						.overlay(
							RoundedRectangle(cornerRadius: 24)
								.strokeBorder(Color.assisitiveText, lineWidth: 2)
						)
				}
			}
		}
		.scrollIndicators(.hidden)
	}
}
#Preview {
	PostListBody()
		.environmentObject(PostListVM())
}
