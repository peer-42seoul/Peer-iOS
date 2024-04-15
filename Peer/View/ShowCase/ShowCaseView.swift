//
//  ShowCaseView.swift
//  Peer
//
//  Created by Hosung Lim on 3/29/24.
//

import SwiftUI

struct ShowCaseView: View {
	@EnvironmentObject var showcase: ShowcaseVM
    var body: some View {
		ZStack {
			Color.primaryBackground
			VStack(alignment: .center) {
				// Header
				ShowCaseHeaderView()
					.padding(20)
				// Body
				ShowCaseBodyView()

				Spacer()
			}
		}
		.onAppear {
			Task {
				await showcase.process(intent: .first)
			}
		}
    }
}

struct ShowcaseCardView: View {
	var name: String
	var id: Int
	var body: some View {
		Text("\(id) \(name)")
	}
}

struct ShowCaseBodyView: View {
	@EnvironmentObject var showcase: ShowcaseVM
	var body: some View {
		ZStack {
			VStack(spacing: 20) {
				ForEach(showcase.showcaseModel.showcases, id: \.id) { showcase in
					ShowcaseCardView(name: showcase.name, id: showcase.id)
				}
			}
		}
	}
}

struct ShowCaseHeaderView: View {
	var body: some View {
		HStack {
			Text("쇼케이스")
				.font(.pretendardBold24)

			Spacer()
		}
	}
}

#Preview {
    ShowCaseView()
		.environmentObject(ShowcaseVM())
}
