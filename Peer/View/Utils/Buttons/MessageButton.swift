//
//  MessageButton.swift
//  Peer
//
//  Created by Hosung Lim on 4/9/24.
//

import SwiftUI

struct MessageButton: View {var clickAction: () -> Void
	var body: some View {
		Button {
			clickAction()
		} label: {
			Image(systemName: "ellipsis.message")
				.resizable()
				.scaledToFit()
		}
		.padding(10)
	}
}

#Preview {
	MessageButton() {}
}
