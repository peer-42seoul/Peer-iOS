//
//  NetworkProtocol.swift
//  Peer
//
//  Created by Hosung Lim on 3/19/24.
//

import Foundation

protocol NetworkProtocol {
	// 네트워크 내부의 구조
	var networkModel: NetworkModel { get set }

	// 네트워크 Get
	func get(url: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void)

	// 네트워크 Post

	// 네트워크 Put

	// 네트워크 Delete


}
