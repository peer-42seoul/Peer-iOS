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
		// HEADER
		PostListHeader()

		// BODY
		PostListBody()
	}
}

#Preview {
	PostListView()
		.environmentObject(PostListVM())
}
