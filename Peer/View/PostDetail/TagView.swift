//
//  TagView.swift
//  Peer
//
//  Created by Hosung Lim on 4/10/24.
//

import SwiftUI

struct TagView: View {
	var name: String
	var color: String
    var body: some View {
		Text(name)
			.font(.pretendardRegular14)
			.foregroundColor(.normalText)
			.padding(6)
			.background(
				Color(hex: color)
					.opacity(0.5)
			)
			.fixedSize(horizontal: true, vertical: false)
			.overlay(
				RoundedRectangle(cornerRadius: 8)
					.strokeBorder(
						Color.assisitiveText,
						lineWidth: 2
					)
			)
			.clipShape(
				.rect(cornerRadius: 8)
			)
    }
}
