//
//  NetworkModel.swift
//  Peer
//
//  Created by Hosung Lim on 3/19/24.
//

import Foundation

struct NetworkModel {
	var session: URLSession
	// API 호출 URL
	var APIurl: String

	init(
		session: URLSession = URLSession.shared,
		apiUrl: String = "https://" + (Bundle.main.infoDictionary?["API_URL"] as? String ?? "wrong")
	) {
		self.session = session
		self.APIurl = apiUrl
	}
}
