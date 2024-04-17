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
