//
//  NetworkVM.swift
//  Peer
//
//  Created by Hosung Lim on 3/21/24.
//

import Foundation

protocol NetworkProtocol {
	// 네트워크 내부의 구조
	var networkModel: NetworkModel { get set }

	// 네트워크 Get
	func get(url: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
	// 네트워크 Put
	func put(url: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
	// 네트워크 Post
	func post(url: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
	// 네트워크 Delete
	func delete(url: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void)

}

class NetworkVM: NetworkProtocol {
	static let shared: NetworkProtocol = NetworkVM()

	var networkModel: NetworkModel

	func get(url: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
		guard let url = URL(string: networkModel.APIurl + url) else {
			fatalError("Missing Url")
		}

		let token = UserDefaults.standard.string(forKey: "Token") ?? nil

		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		request.allHTTPHeaderFields = token != nil ? [
			 "Authorization": "Bearer \(String(describing: token))"
		] : nil

		URLSession.shared.dataTask(with: request, completionHandler: completion).resume()
	}

	func put(url: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
		guard let url = URL(string: networkModel.APIurl + url) else {
			fatalError("Missing Url")
		}

		let token = UserDefaults.standard.string(forKey: "Token") ?? nil

		var request = URLRequest(url: url)
		request.httpMethod = "PUT"
		request.allHTTPHeaderFields = token != nil ? [
			 "Authorization": "Bearer \(String(describing: token))"
		] : nil

		URLSession.shared.dataTask(with: request, completionHandler: completion).resume()
	}

	func post(url: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
		guard let url = URL(string: networkModel.APIurl + url) else {
			fatalError("Missing Url")
		}

		let token = UserDefaults.standard.string(forKey: "Token") ?? nil

		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		request.allHTTPHeaderFields = token != nil ? [
			 "Authorization": "Bearer \(String(describing: token))"
		] : nil

		URLSession.shared.dataTask(with: request, completionHandler: completion).resume()
	}

	func delete(url: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
		guard let url = URL(string: networkModel.APIurl + url) else {
			fatalError("Missing Url")
		}

		let token = UserDefaults.standard.string(forKey: "Token") ?? nil

		var request = URLRequest(url: url)
		request.httpMethod = "delete"
		request.allHTTPHeaderFields = token != nil ? [
			 "Authorization": "Bearer \(String(describing: token))"
		] : nil

		URLSession.shared.dataTask(with: request, completionHandler: completion).resume()
	}

	private init(networkModel: NetworkModel = NetworkModel()) {
		self.networkModel = networkModel
	}
}
