//
//  ShowcaseVM.swift
//  Peer
//
//  Created by Hosung Lim on 3/28/24.
//

import Foundation

protocol ShowcaseNetworkProtocol {
	func getShowcases() async throws
}

protocol ShowcaseProtocol: ObservableObject {}

class ShowcaseVM: ShowcaseProtocol {
	@Published var showcaseModel: ShowcaseModel = ShowcaseModel()
	@Published var loading: Bool = false

	private let network: NetworkProtocol

	func process(intent: ShowcaseIntent) async {
		do {
			switch intent {
			case .first:
				try await getShowcasesFirst()
			default:
				return
			}
		} catch {
			print("Error: \(error)")
		}
	}

	@MainActor
	func getShowcasesFirst() async throws {
		loading = true
		let requestUrl = "/api/v1/showcase?page=1&pageSize=10"
		network.get(url: requestUrl) { [weak self] data, response, error in
			Task {
				if let response = response as? HTTPURLResponse {
					let statusCode = response.statusCode
				}
				if let data = data, error == nil {
					do {
						let response = try JSONDecoder().decode(Pagenation<[Showcase]>.self, from: data)
						self?.showcaseModel.showcases = response.content
						self?.showcaseModel.error = nil
						self?.loading = false
					} catch {
						print("JSON 디코딩 실패:", error)
						self?.showcaseModel.error = error
					}
				} else {
					self?.showcaseModel.error = error
					print(error!)
				}
			}
		}
	}

	init(networkProtocol: NetworkProtocol = NetworkVM.shared) {
		self.network = networkProtocol
	}
}
