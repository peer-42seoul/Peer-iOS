//
//  HeartButton.swift
//  Peer
//
//  Created by Hosung Lim on 4/9/24.
//

import SwiftUI

struct HeartButton: View {
	@State var isClicked: Bool
	var clickAction: () -> Void
    var body: some View {
		Button {
			clickAction()
		} label: {
			Image(systemName: isClicked ? "heart.fill" : "heart")
				.resizable()
				.scaledToFit()
		}
		.padding(10)
    }
}

#Preview {
    HeartButton(isClicked: true) {
	}
}
