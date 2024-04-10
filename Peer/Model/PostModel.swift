//
//  PostModel.swift
//  Peer
//
//  Created by Hosung Lim on 3/20/24.
//

import Foundation

// 메인 화면에서 게시물에 관한 모델
struct PostsListModel {
	// 변수
	// 메인 화면에 보일 게시물의 리스트
	var posts: [PostList]
	var page: Int = 1
	// 보여질 타입 값 : ALL / STUDY / PROJECT
	var type: PostType
	// 필터 설정 값 :
	var filter: Filter
	var sort: String
	var keyword: String
	// 로딩 중인지
	var loading: Bool = false
	var error: Error?

	init() {
		self.posts = []
		self.type = .STUDY
		self.filter = Filter()
		self.sort = "latest"
		self.keyword = ""
	}
}

// 필터에 대한 모델
extension PostsListModel {
	var filterToStringTest: String {
		let filter = "?type=STUDY&sort=latest&page=1&pageSize=10&keyword=&due=1주일&due=12개월 이상&region1=&region2=&place=&status=&tag="
		return filter
	}

	var filterToString: String {
		let filter = "?type=\(type)&sort=\(sort)&page=\(page)&pageSize=10&keyword=\(keyword)&due=\(filter.due1)&due=\(filter.region2)&region1=\(filter.region1)&region2=\(filter.region2)&place=\(filter.place)&status=\(filter.status)&tag=\(filter.tag)"
		return filter
	}

	var testPagination: String {
		let filter = "?type=STUDY&sort=latest&page=\(page)&pageSize=10&keyword=&due=1주일&due=12개월 이상&region1=&region2=&place=&status=&tag="
		return filter
	}
}

// 메인화면에서 보여줄 게시판의 정보
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

enum EPostStatus: String, Codable {
	case BEFORE
	case ONGOING
	case AFTER
}

struct Role: Codable {
	var name: String = ""
	var number: Int = 0
	var current: Int = 0
}

struct PostDetailModel: Codable {
	var title: String = ""
	var status: String = ""
	var due: String = ""
	var content: String = ""
	var leaderID: Int = 0
	var leaderImage: String?
	var leaderNickname: String = ""
	var region: [String]?
	var link: String = ""
	var tagList: [Tag] = []
	var roleList: [Role] = []
	var place: String = ""
	var image: String = ""
	var totalNumber: Int = 0
	var current: Int?
	var favorite: Bool = false
	var teamName: String = ""

	enum CodingKeys: String, CodingKey {
		case title
		case status
		case due
		case content
		case leaderID = "leader_id"
		case leaderImage = "leader_image"
		case leaderNickname = "leader_nickname"
		case region
		case link
		case tagList
		case roleList
		case place
		case image
		case totalNumber
		case current
		case favorite
		case teamName
	}
}
