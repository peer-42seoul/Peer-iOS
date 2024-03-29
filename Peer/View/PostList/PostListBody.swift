//
//  MainBodyView.swift
//  Peer
//
//  Created by Hosung Lim on 3/29/24.
//

import SwiftUI

struct PostListBody: View {
	@EnvironmentObject var post: PostListVM

    var body: some View {
		LazyVStack() {
			ForEach(post.postListModel.posts, id: \.title) { post in
				Text(post.title)
			}
		}
    }
}

#Preview {
    PostListBody()
		.environmentObject(PostListVM())
}
