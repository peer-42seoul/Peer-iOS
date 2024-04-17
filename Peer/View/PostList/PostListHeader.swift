//
//  MainHeaderView.swift
//  Peer
//
//  Created by Hosung Lim on 3/29/24.
//

import SwiftUI

struct PostListHeader: View {
	@State private var isHeaderHidden = false

    var body: some View {
		GeometryReader { geometry in
			VStack(alignment: .center, spacing: 0) {
				if !isHeaderHidden {
					HStack(alignment: .center) {
						// 알림 창
						Button {

						} label: {
							Image(systemName: "bell")
								.resizable()
								.scaledToFit()
								.foregroundColor(.white)
								.frame(width: 30, height: 30)
								.padding(10)
						}

						Spacer()

						// 로고

						Image("StringLogo")
							.resizable()
							.scaledToFit()
							.frame(width: 80)

						Spacer()

						// 검색
						Button {

						} label: {
							Image(systemName: "magnifyingglass")
								.resizable()
								.scaledToFit()
								.foregroundColor(.white)
								.frame(width: 30, height: 30)
								.padding(10)
						}
					}
					.frame(maxHeight: .infinity)
					
				}
			}
		}
		.frame(height: 60)
    }
}

#Preview {
	PostListHeader()
}
