//
//  Model.swift
//  Peer
//
//  Created by Hosung Lim on 3/18/24.
//

import Foundation

//페이지 네이션 관련 객체
struct PagenationSort: Codable {
	var empty: Bool?
	var unsorted: Bool?
	var sorted: Bool?
}

struct PagenationInfo: Codable {
	var sort: PagenationSort
	var offset: Int?
	var pageNumber: Int?
	var pageSize: Int?
	var paged: Bool?
	var unpaged: Bool?
}

struct Pagenation<T: Codable> {
	var content: T?
	var pagable: PagenationInfo
	var totalPage: Int?
	var totalElements: Int?
	var last: Bool?
	var size: Int?
	var number: Int?
	var sort: PagenationSort?
	var numberOfElements: Int?
	var first: Bool?
	var empty: Bool?
}

// 유저의 기본 정보
struct UserInfomationModel: Codable {
	var nickname: String
	var userID: Int
	// 유저의 로그인 정보
	var isSignIn: Bool
}

struct PostsListModel {
	// 변수
	// 메인 화면에 보일 게시물의 리스트
	var posts: [Post]
	// 보여질 타입 값 : ALL / STUDY / PROJECT
	var type: PostType
	// 필터 설정 값 :
	var filter: Filter
}

struct Team {
	// 팀 이름
	// 팀 타입
	// 팀 상태
	// 팀 
}

struct PostModel {
	// 게시물의 이름
	var name: String
	// 게시물의 작성자
	var onwer: String
	// 게시물의 팀 정보
	var team: Team
	// 게시물의 설명 내용

}


