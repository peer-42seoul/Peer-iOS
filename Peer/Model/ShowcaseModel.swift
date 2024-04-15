//
//  ShowcaseModel.swift
//  Peer
//
//  Created by Hosung Lim on 4/15/24.
//

import Foundation

struct ShowcaseTag: Codable {
	var id: Int?
	var name: String?
	var color: String?
}

struct Showcase: Codable {
	var id: Int
	var image: String?
	var name: String
	var description: String
	var skill: [ShowcaseTag] = []
	var like: Int
	var liked: Bool
	var favorite: Bool
	var teamLogo: String?
	var start: String
	var end: String
	var hasBeenRemoved: Bool?
}

struct ShowcaseModel {
	var showcases: [Showcase] = []
	var error: Error?
}
