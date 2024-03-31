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
			VStack(spacing: 0) {
				if !isHeaderHidden {
					Text("여기는 헤더!")
						.frame(height: 60)
						.frame(maxWidth: .infinity)
						.background(Color("TertiaryBackground"))
				}
			}
		}
		.frame(height: 60)
    }
}

#Preview {
	PostListHeader()
}
