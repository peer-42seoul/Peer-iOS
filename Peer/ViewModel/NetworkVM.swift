//
//  NetworkVM.swift
//  Peer
//
//  Created by Hosung Lim on 3/21/24.
//

import Foundation

class NetworkVM: NetworkProtocol {
	var networkModel: NetworkModel

	func get(url: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
		guard let url = URL(string: networkModel.APIurl + url) else {
			fatalError("Missing Url")
		}

		let token = UserDefaults.standard.string(forKey: "Token") ?? nil

		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		request.allHTTPHeaderFields = [
			token != nil ? "Authorization": "Bearer \(String(describing: token))" : ""
		]

		URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
	}

	init(networkModel: NetworkModel) {
		self.networkModel = networkModel
	}
}
