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
		postListModel.loading = true
		let url = "/api/v1/recruitment" + postListModel.filterToStrint
		network.get(url: url) { [weak self] data, response, error in
			DispatchQueue.main.async {
				self?.postListModel.loading = false
				if let data = data, error == nil {
					do {
						let posts = try JSONDecoder().decode([PostTest].self, from: data)
						print(posts)
//						self?.postListModel.posts = posts
						self?.postListModel.error = nil
					} catch {
						// 디코딩 과정에서 오류가 발생했을 때, 오류 처리 로직
						print("JSON 디코딩 실패:", error)
						self?.postListModel.error = error
					}
				} else {
					// 네트워크 요청 실패 또는 데이터가 없을 때의 오류 처리 로직
					print(error)
					self?.postListModel.error = error
				}
			}
		}
	}


	init(networkProtocol: NetworkProtocol) {
		self.network = networkProtocol
	}
}
