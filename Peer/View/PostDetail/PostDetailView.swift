//
//  PostDetailView.swift
//  Peer
//
//  Created by Hosung Lim on 4/1/24.
//

import SwiftUI

struct PostDetailView: View {
	@StateObject var postDetailModel: PostDetailVM = PostDetailVM()
	var postId: Int

    var body: some View {
		ZStack {
			Color(.primaryBackground)
				.ignoresSafeArea()
			VStack {
				// 디테일뷰 Header
				VStack {

				}
				// 디테일뷰 Body
				Text("Hello, \(postId)")
				Text("content: \(postDetailModel.postDetail.content)")
			}
		}
		.onAppear {
			Task {
				await postDetailModel.process(intent: .open)
			}
		}
    }

	init(postId: Int) {
		self.postId = postId
		_postDetailModel = StateObject(wrappedValue: PostDetailVM(id: postId))
	}
}

#Preview {
    PostDetailView(postId: 138)
}
