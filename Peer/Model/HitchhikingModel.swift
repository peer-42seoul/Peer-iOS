//
//  HitchhikingModel.swift
//  Peer
//
//  Created by Hosung Lim on 3/20/24.
//

import Foundation

struct Hitchhiking: Codable, Identifiable {
	var id: Int = 0
	var authorImage: String?
	var authorId: Int = 0
	var teamName: String = ""
	var title: String = ""
	var tagList: [Tag] = []
	var image: String = ""
	var favorite: Bool?
	var hasBeenRemoved: Bool?

	enum CodingKeys: String, CodingKey {
		case id = "recruitId"
		case authorImage
		case authorId
		case teamName
		case title
		case tagList
		case image
		case favorite
		case hasBeenRemoved
	}
}

struct HitchhikingModel {
	var hitchhikings: [Hitchhiking] = []
	var error: Error?
}
