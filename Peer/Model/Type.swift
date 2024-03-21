//
//  Type.swift
//  Peer
//
//  Created by Hosung Lim on 3/18/24.
//

import Foundation

// enum
// 게시물 타입에 대한 enum
enum PostType: String {
	case ALL
	case STUDY
	case PROJECT
}

// 팀의 활동 상태에 대한 enum
enum TeamStatus: String, Codable {
	case INGOING
}

// 필터 중 due에 대한 값
enum Due: String, Codable {
	case aWeek = "1주일"
	case aMonth = "1개월"
	case threeMonth = "3개월"
	case sixMonth = "6개월"
	case nineMonth = "9개월"
	case twelveMonth = "12개월 이상"
}

// type
// 메인 화면 필터 값에 대한 타입
struct Filter: Codable {
	var due1: Due
	var due2: Due
	var region1: String
	var region2: String
	var place: String
	var status: String
	var tag: String

	init() {
		self.due1 = .aWeek
		self.due2 = .twelveMonth
		self.region1 = ""
		self.region2 = ""
		self.place = ""
		self.status = ""
		self.tag = ""
	}
}

// 메인 화면에 보여질 게시물의 타입
struct Post: Codable {
	var name: String
	var type: String
	var status: TeamStatus
}

// 게시물 내부의 정보
struct PostDetail: Codable {

}
