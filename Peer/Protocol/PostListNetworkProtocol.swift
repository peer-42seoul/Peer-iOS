//
//  PostListNetworkProtocol.swift
//  Peer
//
//  Created by Hosung Lim on 3/19/24.
//

import Foundation

protocol PostListGetProtocol {
	// 메인 화면에서 보여질 게시물 들고 오기
	func getPostList() async -> [Post]
	// 메인 화면에서 필터를 걸고 보여질 게시물 들고 오기
	func getPorstListByFilter(filter: Filter) async -> [Post]
}

protocol PostListNetworkProtocol: PostListGetProtocol {
}
