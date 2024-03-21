//
//  PostVM.swift
//  Peer
//
//  Created by Hosung Lim on 3/19/24.
//

import Foundation

class PostVM: ObservableObject {
	@Published private(set) var postListModel: PostsListModel = PostsListModel()

	private let network: NetworkProtocol

	func process(intent: PostIntent) async {
		switch intent {
		case .open:
			getPostList()
		default:
			return
		}
	}

	func getPostList() {

	}

	init(networkProtocol: NetworkProtocol) {
		self.network = networkProtocol
	}
}
