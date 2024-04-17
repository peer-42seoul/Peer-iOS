//
//  HitchhikingModel.swift
//  Peer
//
//  Created by Hosung Lim on 3/20/24.
//

import Foundation

struct Hitchhiking: Codable {
	var authorImage: String = ""
	var authorId: Int = 0
	var teamName: String = ""
	var title: String = ""
	var recruitId: Int = 0
	var tagList: [Tag] = []
	var image: String = ""
	var favorite: Bool?
	var hasBeenRemoved: Bool?
}

struct HitchhikingModel {
	var hitchhikings: [Hitchhiking] = []
	var error: Error?
}
