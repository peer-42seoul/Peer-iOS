//
//  PostListFilterView.swift
//  Peer
//
//  Created by Hosung Lim on 3/31/24.
//

import SwiftUI

struct PostListFilterView: View {
    var body: some View {
		ZStack {
			Color.tertiaryBackground
			VStack {
				// All / Study / Project
//				FilterForTypeView(tabIndex: )

				// Filter

				// Sort
			}
		}
		.frame(height: 100)
    }
}

struct FilterTabBarItem: View {
	@Binding var tabIndex: Int
	var name: String
	var body: some View {
		Button {

		} label: {
			VStack {
//				if tabIndex == index {
//					Text(name)
//						.font(.pretendardBold24)
//						.foregroundColor(.white)
//				} else {
//					Text(name)
//						.font(.pretendardBold18)
//						.foregroundColor(.alternativeText)
//				}
			}
		}
	}
}

struct FilterForTypeView: View {
	@Binding var tabIndex: Int
	@Namespace var namespace
	let types = ["전체", "스터디", "프로젝트"]

	var body: some View {
		HStack {
			ForEach(types, id: \.self) { type in
				FilterTabBarItem(
					tabIndex: $tabIndex, 
					name: type
				)
			}
		}
	}
}

#Preview {
    PostListFilterView()
}
