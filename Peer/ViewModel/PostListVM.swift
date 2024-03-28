//
//  PostListVM.swift
//  Peer
//
//  Created by Hosung Lim on 3/19/24.
//

import Foundation

protocol PostListGetProtocol {
	// 메인 화면에서 보여질 게시물 들고 오기
	// TODO: - 무한 스크롤
	func getPostList() async
	// 메인 화면에서 필터를 걸고 보여질 게시물 들고 오기
	func getPorstListByFilter(filter: Filter) async
	// 화면 땡기는 새로고침
	func refresh() async
	// 검색 기능
	func searchPost() async
	// PostDetail 글 보기
	func enterPostDetail() async
	// 새 글 쓰기
	func createNewPost() async
}

protocol PostListNetworkProtocol: PostListGetProtocol {
}

class PostListVM: ObservableObject, PostListNetworkProtocol {
	@Published var postListModel: PostsListModel = PostsListModel()

	private let network: NetworkProtocol

	// intent 관리
	func process(intent: PostIntent) async {
		switch intent {
		case .open:
			await getPostList()
		case .filter:
			await getPorstListByFilter(filter: postListModel.filter)
		case .scroll:
			await getPostList()
		case .refresh:
			await refresh()
		case .touchPost:
			await enterPostDetail()
		case .search:
			await searchPost()
		default:
			return
		}
	}

	@MainActor
	func getPostList() async {
		postListModel.loading = true
		let url = "/api/v1/recruit" + postListModel.filterToString
		network.get(url: url) { [weak self] data, response, error in
			DispatchQueue.main.async {
				// TODO: - Response에 맞는 처리 필요
				if let data = data, error == nil {
					do {
						let posts = try JSONDecoder().decode(Pagenation<[PostList]>.self, from: data)
						self?.postListModel.posts = posts.content
						self?.postListModel.error = nil

						self?.postListModel.loading = false
						print("getPostList on")
					} catch {
						// 디코딩 과정에서 오류가 발생했을 때, 오류 처리 로직
						print("JSON 디코딩 실패:", error)
						self?.postListModel.error = error
					}
				} else {
					// 네트워크 요청 실패 또는 데이터가 없을 때의 오류 처리 로직
					self?.postListModel.error = error
				}
			}
		}
	}

	func getPorstListByFilter(filter: Filter) async {
		<#code#>
	}

	func refresh() async {
		<#code#>
	}

	func searchPost() async {
		<#code#>
	}

	func enterPostDetail() async {
		<#code#>
	}

	func createNewPost() async {
		<#code#>
	}

	init(networkProtocol: NetworkProtocol = NetworkVM.shared) {
		self.network = networkProtocol
	}
}
