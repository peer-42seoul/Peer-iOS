//
//  PostListVM.swift
//  Peer
//
//  Created by Hosung Lim on 3/19/24.
//

import Foundation

class PostListVM: ObservableObject {
	@Published private(set) var post: [Post]

	private let network: NetworkProtocol

	func process(intent: PostListIntent) async {
		switch intent {
		case .open:
			post = await network.getPostList()
		default:
			return
		}
	}

	init(networkProtocol: NetworkProtocol) {
		self.network = networkProtocol
		self.post = []
	}
}
