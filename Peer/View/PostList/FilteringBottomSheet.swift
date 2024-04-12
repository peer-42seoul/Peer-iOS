//
//  FilteringBottomSheet.swift
//  Peer
//
//  Created by Hosung Lim on 4/12/24.
//

import SwiftUI

struct FilteringBottomSheet: View {
	@Environment(\.presentationMode) var presentationMode
	@State private var relativeTagSearchWord: String = ""
	@State private var filteredData: [String] = ["Apple", "Banana", "Cherry", "Date", "Elderberry"]

	func filterData() {
		if relativeTagSearchWord.isEmpty {
			filteredData = []
		} else {
			filteredData = ["Apple", "Banana", "Cherry", "Date", "Elderberry"].filter {
				$0.lowercased().contains(relativeTagSearchWord.lowercased())
			}
		}
	}

	var body: some View {
		ZStack {
			Color.secondaryBackground
			VStack {
				HStack {
					Text("맞춤 스터디를 찾아보세요!")
						.font(.pretendardMedium18)
						.foregroundColor(.accent)
					Spacer()
					Button(action: {
						presentationMode.wrappedValue.dismiss()
					}, label: {
						Image(systemName: "xmark")
							.font(.pretendardMedium18)
					})
				}
				.padding(20)

				VStack(spacing: 20) {
					VStack {
						Text("관련 태그")
							.font(.pretendardBold18)
							.frame(maxWidth: .infinity, alignment: .leading)
						HStack {
							TextField("검색중...", text: $relativeTagSearchWord)
								.padding(7)
								.padding(.horizontal, 25)
						}
					}

					VStack {
						Text("목표시간")
							.font(.pretendardBold18)
							.frame(maxWidth: .infinity, alignment: .leading)
					}

					VStack {
						Text("모집 상태")
							.font(.pretendardBold18)
							.frame(maxWidth: .infinity, alignment: .leading)
					}

					VStack {
						Text("활동 지역")
							.font(.pretendardBold18)
							.frame(maxWidth: .infinity, alignment: .leading)
					}

					VStack {
						Text("활동 방식")
							.font(.pretendardBold18)
							.frame(maxWidth: .infinity, alignment: .leading)
					}

					Spacer()
				}
				.padding(20)
			}
		}
	}
}

#Preview {
	FilteringBottomSheet()
}
