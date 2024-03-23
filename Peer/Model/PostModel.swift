//
//  PostModel.swift
//  Peer
//
//  Created by Hosung Lim on 3/20/24.
//

import Foundation

struct PostsListModel {
	// 변수
	// 메인 화면에 보일 게시물의 리스트
	var posts: [Post]
	var page: Int = 1
	// 보여질 타입 값 : ALL / STUDY / PROJECT
	var type: PostType
	// 필터 설정 값 :
	var filter: Filter
	// 로딩 중인지
	var loading: Bool = false
	var error: Error?

	init() {
		self.posts = []
		self.type = .ALL
		self.filter = Filter()
	}
}

extension PostsListModel {
	var filterToStrint: String {
		let filter = "?type=study&sort=latest&page=\(page)&pagesize=9&keword=키워드&due=1주일&region=김포&place=ONLINE&status=ONGOING&tag=Java&tag=JavaScript"
		return filter
	}
}

struct PostModel {
	// 게시물의 이름
	var name: String
	// 게시물의 작성자
	var onwer: String
	// 게시물의 팀 정보
	var team: TeamModel
	// 게시물의 설명 내용

	init() {
		self.name = ""
		self.onwer = ""
		self.team = TeamModel()
	}
}
