//
//  RelatedToCard.swift
//  Peer
//
//  Created by Hosung Lim on 4/16/24.
//

import SwiftUI

struct ShowcaseCardView: View {
	var title: String
	var imageUrl: String?
	var body: some View {
		VStack {
			ShowcaseCardImageView(imageUrl: imageUrl)
				.frame(height: 500)
			Text("\(title)")
		}
	}
}

struct ShowcaseCardImageView: View {
	var bottomSharpen: Bool?
	var imageUrl: String?
	var body: some View {
		ZStack {
			Color.tertiaryBackground

			if imageUrl != nil {
				AsyncImage(url: URL(string: imageUrl!)) { image in
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
			} else {
				Image("Icon")
					.resizable()
					.aspectRatio(1.65, contentMode: .fit)
					.frame(width: ScreenSize.screenWidth! - 40, height: 220)
					.clipped()
					.scaledToFill()
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

struct ShowcaseCardStack<Content: View, Item: RandomAccessCollection>: View where Item.Element: Identifiable {
	var isRotated: Bool = false
	var showcases: Item
	var content: (Item.Element) -> Content

	var body: some View {
		GeometryReader {
			Color("PrimaryBackground")
				.ignoresSafeArea()

			let size = $0.size
			TabView {
				ForEach(showcases) { showcase in
					content(showcase)
						.frame(
							width: size.width - 10,
							height: size.height)
						.rotationEffect(.degrees(-90))
				}
			}
			.frame(width: size.height, height: size.width)
			.rotationEffect(.degrees(90), anchor: .topLeading)
			.offset(x: size.width)
		}
		.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
	}
}

#Preview {
	ZStack {
		Color.primaryBackground
			.ignoresSafeArea()
		ShowcaseCardView(
			title: "example"
		)
	}
}
