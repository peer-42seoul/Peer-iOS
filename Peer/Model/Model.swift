//
//  Model.swift
//  Peer
//
//  Created by Hosung Lim on 3/18/24.
//

import Foundation

//페이지 네이션 관련 객체
struct Sort: Codable {
	let empty, unsorted, sorted: Bool
}

struct Pageable: Codable {
	let sort: Sort
	let offset, pageNumber, pageSize: Int
	let paged, unpaged: Bool
}

//struct Pagenation<T: Codable>: Codable {
//	var content: T?
//	var pagable: PagenationInfo
//	var totalPage: Int?
//	var totalElements: Int?
//	var last: Bool?
//	var size: Int?
//	var number: Int?
//	var sort: PagenationSort?
//	var numberOfElements: Int?
//	var first: Bool?
//	var empty: Bool?
//}

//struct Pagenation<T: Codable>: Codable {
//	let content: T
//	let pageable: Pageable
//	let last: Bool
//	let totalPages, totalElements, size, number: Int
//	let sort: Sort
//	let first: Bool
//	let numberOfElements: Int
//	let empty: Bool
//}

struct Pagenation<T: Codable>: Codable {
	let content: T
	let pageable: Pageable
	let last: Bool
	let totalPages, totalElements, size, number: Int
	let sort: Sort
	let first: Bool
	let numberOfElements: Int
	let empty: Bool

	enum CodingKeys: String, CodingKey {
		case content
		case pageable
		case last
		case totalPages
		case totalElements
		case size
		case number
		case sort
		case first
		case numberOfElements
		case empty
	}
}
