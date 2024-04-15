//
//  PostDetailVM.swift
//  Peer
//
//  Created by Hosung Lim on 3/28/24.
//

import Foundation

protocol PostDetailNetworkProtocol {
	// 게시물 디테일 페이지에서 필요한 네트워크 관련 함수
	// 게시물 정보 불어오기
	func getPostDetail() async throws
	// 게시물에 지원하기
	func submitPostDetail() async throws
}

class PostDetailVM: ObservableObject, PostDetailNetworkProtocol {
	@Published private var isLoading: Bool = false
	@Published var error: Error?
	@Published var id: Int
	// 게시물의 디테일한 정보
	@Published var postDetail: PostDetailModel = PostDetailModel()
	// 네트워크
	private let network: NetworkProtocol
	// intent 관리
	func process(intent: PostDetailIntent) async {
		do {
			switch intent {
			case .open:
				try await getPostDetail()
			default:
				return
			}
		} catch {
			print("Error: \(error)")
		}
	}

	@MainActor
	func getPostDetail() async throws {
		isLoading = true
		let url = "/api/v1/recruit/\(id)"
		network.get(url: url) { [weak self] data, _, error in
			DispatchQueue.main.async {
				if let data = data, error == nil {
					do {
						let response = try JSONDecoder().decode(PostDetailModel.self, from: data)
						self?.postDetail = response
					} catch {
						print(error)
						self?.error = error
					}
				} else {
					print(error!)
					self?.error = error
				}
			}

		}
	}

	@MainActor
	func submitPostDetail() async throws {

	}

	init(id: Int = 0, network: NetworkProtocol = NetworkVM.shared) {
		self.id = id
		self.network = network
	}
}
