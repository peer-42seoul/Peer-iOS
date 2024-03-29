//
//  PostsListProtocol.swift
//  Peer
//
//  Created by Hosung Lim on 3/18/24.
//

import Foundation

protocol PostsFetchProtocol {
	func getPostList() async -> [Post]
}

protocol PostsListProtocol {}
