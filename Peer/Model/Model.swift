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

struct Pagenation<T: Codable>: Codable {
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
