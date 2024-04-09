//
//  MoreButton.swift
//  Peer
//
//  Created by Hosung Lim on 4/9/24.
//

import SwiftUI

struct MoreButton: View {
	var clickAction: () -> Void
    var body: some View {
		Button {
			clickAction()
		} label: {
			Image(systemName: "ellipsis")
				.resizable()
				.scaledToFit()
		}
		.padding(10)
    }
}

#Preview {
	MoreButton() {
	}
}
