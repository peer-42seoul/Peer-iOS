//
//  AsyncImageView.swift
//  Peer
//
//  Created by Hosung Lim on 4/9/24.
//

import SwiftUI

struct AsyncProfileImageView: View {
	var imageUrl: String?
	var body: some View {
		ZStack {
			Color.tertiaryBackground
			if imageUrl != nil {
				AsyncImage(url: URL(string: imageUrl!)) { image in
					image
						.resizable()
						.frame(width: 50, height: 50)
						.clipped()
						.cornerRadius(50.0)
				} placeholder: {
					ProgressView()
						.frame(width: 50, height: 50)
						.clipped()
				}
				.padding(10)
			} else {
				Image("Icon")
					.resizable()
					.frame(width: 50, height: 50)
					.clipped()
					.cornerRadius(50.0)
					.padding(10)
			}
		}
		.frame(width: 50, height: 50)
		.clipped()
		.cornerRadius(50.0)

	}
}

struct AsyncImageView: View {
	var bottomSharpen: Bool?
	var imageUrl: String
	var body: some View {
		ZStack {
			Color.tertiaryBackground
			AsyncImage(url: URL(string: imageUrl)) { image in
				image
					.resizable()
					.aspectRatio(1.65, contentMode: .fit)
					.frame(width: ScreenSize.screenWidth! - 40, height: 220)
					.clipped()
					.scaledToFill()

			} placeholder: {
				ProgressView()
					.frame(width: ScreenSize.screenWidth! - 40, height: 220)
					.clipped()
			}
		}
		.clipShape(bottomSharpen == true ?
			.rect(
				topLeadingRadius: 24,
				bottomLeadingRadius: 0,
				bottomTrailingRadius: 0,
				topTrailingRadius: 24
			)
				   :
				.rect(
					topLeadingRadius: 24,
					bottomLeadingRadius: 24,
					bottomTrailingRadius: 24,
					topTrailingRadius: 24
				)
		)
	}
}
