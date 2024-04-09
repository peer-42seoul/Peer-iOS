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
				.cornerRadius(50.0)
				.padding(10)
		}

	}
}

struct AsyncImageView: View {
	var imageUrl: String
	var body: some View {
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
}
