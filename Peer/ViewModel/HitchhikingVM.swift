//
//  HitchhikingVM.swift
//  Peer
//
//  Created by Hosung Lim on 3/28/24.
//

import Foundation

protocol HitchhikingProtocol: ObservableObject {

}

enum HitchhikingType: String {
	case STUDY
	case PROJECT
}

class HitchhikingVM: HitchhikingProtocol {
	@Published var hitchhikingModel: HitchhikingModel = HitchhikingModel()
	@Published var loading: Bool = false
	@Published var pageNumber: Int = 1
	@Published var type: HitchhikingType = .STUDY

	private let network: NetworkProtocol

	func process(intent: HitchhikingIntent) async {
		do {
			switch intent {
			case .initialize:
				try await getHitchhikingFirst()
			case .scroll:
				try await getHitchhiking()
			default:
				return
			}
		} catch {
			print("Hitchhiking : \(error)")
		}
	}

	@MainActor
	func getHitchhiking() async throws {
		loading = true
		let requestUrl = "/api/v1/hitch?page=\(pageNumber)&pageSize=20&type=\(type)"
		network.get(url: requestUrl) { [weak self] data, response, error in
			Task {
				if let response = response as? HTTPURLResponse {
					let statusCode = response.statusCode
				}
				if let data = data, error == nil {
					do {
						let response = try JSONDecoder().decode(Pagenation<[Hitchhiking]>.self, from: data)
						self?.pageNumber += 1
						self?.hitchhikingModel.hitchhikings = response.content
						self?.hitchhikingModel.error = nil
						self?.loading = false
					} catch {
						print("JSON 디코딩 실패:", error)
						self?.hitchhikingModel.error = error
					}
				} else {
					self?.hitchhikingModel.error = error
					print(error!)
				}
			}
		}
	}

	@MainActor
	func getHitchhikingFirst() async throws {
		loading = true
		let requestUrl = "/api/v1/hitch?page=1&pageSize=10&type=PROJECT"
		network.get(url: requestUrl) { [weak self] data, response, error in
			Task {
				if let response = response as? HTTPURLResponse {
					let statusCode = response.statusCode
				}
				if let data = data, error == nil {
					do {
						let response = try JSONDecoder().decode(Pagenation<[Hitchhiking]>.self, from: data)
						self?.pageNumber += 1
						self?.hitchhikingModel.hitchhikings = response.content
						self?.hitchhikingModel.error = nil
						self?.loading = false
					} catch {
						print("JSON 디코딩 실패:", error)
						self?.hitchhikingModel.error = error
					}
				} else {
					self?.hitchhikingModel.error = error
					print(error!)
				}
			}
		}
	}

	init(network: NetworkProtocol = NetworkVM.shared) {
		self.network = network
	}

}
