//
//  ShowCaseView.swift
//  Peer
//
//  Created by Hosung Lim on 3/29/24.
//

import SwiftUI

/// TODO
/// 1. 하단 앱바의 색상 맞추기
/// 2. 전체 카드의 크기 고정(비율이라도)
/// 3. 시작일 / 종료일 맞추기
/// 4. 좋아요 / 관심 버튼 만들기

struct ShowCaseView: View {
	@EnvironmentObject var showcase: ShowcaseVM
	var body: some View {
		ZStack {
			Color("PrimaryBackground")
				   .ignoresSafeArea()

			VStack(alignment: .center) {

				ShowCaseHeaderView()
					.padding(20)

				NavigationStack {
					VStack {
						ShowcaseCardStack(
							showcases: showcase.showcaseModel.showcases
						) { item in
							ShowcaseCardView(
								card: item
							)
							.padding(10)
						}
					}
				}

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

#Preview {
	ShowCaseView()
		.environmentObject(ShowcaseVM())
}
