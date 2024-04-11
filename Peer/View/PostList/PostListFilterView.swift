//
//  PostListFilterView.swift
//  Peer
//
//  Created by Hosung Lim on 3/31/24.
//

import SwiftUI

struct PostListFilterView: View {
	@State private var selectedType: String = "전체"
	@State private var showFilter: Bool = false

	var body: some View {
		ZStack(alignment: .leading) {
			Color.tertiaryBackground
			HStack {
				// 리스트 분류 선택
				SelectSortForPost(selectedType: $selectedType)
				Spacer()
				// 필터링 버튼
				Button(action: {
					showFilter.toggle()
				}, label: {
					Text("Button")
				})
			}
			.padding(20)
		}
		.frame(maxHeight: 70)
		.sheet(isPresented: $showFilter, content: {
			FilteringBottomSheet()
		})
	}
}

struct FilteringBottomSheet: View {
	@Environment(\.presentationMode) var presentationMode
	var body: some View {
		ZStack {
			Color.tertiaryBackground
				.ignoresSafeArea()
			VStack {
				HStack {
					Spacer()
					Button(action: {
						presentationMode.wrappedValue.dismiss()
					}) {
						Image(systemName: "xmark")
					}
				}
				.padding(20)
				Spacer()
				
				Spacer()
			}
		}
	}
}

struct SortPostItem: View {
	var name: String
	var action: () -> Void // 탭 선택 시 수행할 액션
	var isSelected: Bool = false

	var body: some View {
		Button(action: action) {
			VStack {
				Text(name)
					.font(.pretendardBold24)
					.foregroundColor(
						isSelected ? .normalText : .alternativeText)
					.scaleEffect(isSelected ? 1.2 : 1.0)
					.animation(.easeInOut(duration: 0.3), value: isSelected)
			}
		}
	}
}

struct SelectSortForPost: View {
	let types = ["전체", "스터디", "프로젝트"]
	@Binding var selectedType: String

	var body: some View {
		HStack(alignment: .bottom, spacing: 20) {
			ForEach(types, id: \.self) { type in
				SortPostItem(
					name: type,
					action: {
						selectedType = type
					},
					isSelected: selectedType == type
				)
			}
		}
	}
}

#Preview {
	PostListFilterView()
}
