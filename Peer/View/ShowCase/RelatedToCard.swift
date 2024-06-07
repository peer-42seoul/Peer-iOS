//
//  RelatedToCard.swift
//  Peer
//
//  Created by Hosung Lim on 4/16/24.
//

import SwiftUI

struct ShowcaseCardView: View {
	var card: Showcase
	var body: some View {
		ZStack {
			Color.secondaryBackground
			VStack(alignment: .leading) {
				ShowcaseCardImageView(imageUrl: card.image)
					.frame(height: 350)
				HStack {
					AsyncProfileImageView(imageUrl: card.teamLogo)

					Text(card.name)
						.font(.pretendardMedium18)
						.foregroundColor(.alternativeText)

					Spacer()
					// TODO: 좋아요 버튼
					// TODO: 관심목록 추가 버튼
				}

				HStack {
					Text(card.description)
						.font(.pretendardMedium16)
						.lineLimit(3)
				}
				.frame(height: 80, alignment: .top)

				VStack(spacing: 10) {
					HStack {
						Label("시작일", systemImage: "calendar")
							.font(.pretendardRegular16)
						Text(card.start)
							.font(.pretendardRegular16)
						Spacer()
					}
					HStack {
						Label("종료일", systemImage: "calendar")
							.font(.pretendardRegular16)
						Text(card.end)
							.font(.pretendardRegular16)
						Spacer()
					}

					HStack {
						Label("기술스택", systemImage: "tag")
							.font(.pretendardRegular16)

						if !card.skill.isEmpty {
							ScrollView(.horizontal) {
								HStack {
									ForEach(card.skill, id: \.color) { tag in
										TagView(name: tag.name!, color: tag.color!)
											.scaleEffect(1)
									}
								}
							}
						}

						Spacer()
					}

				}
				Spacer()
			}
			.padding(20)
		}
		.padding(10)
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
	@EnvironmentObject var showcaseVm: ShowcaseVM

	var body: some View {
		GeometryReader {
			Color("PrimaryBackground")
				.ignoresSafeArea()

			let size = $0.size
			TabView {
				ForEach(Array(showcases.enumerated()), id: \.element.id) { index, showcase in
					content(showcase)
						.frame(
							width: size.width - 10,
							height: size.height)
						.rotationEffect(.degrees(-90))
						.onAppear {
							if index == showcases.count - 2 {
								Task {
									await showcaseVm.process(intent: .scroll)
								}
							}
						}
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
	}
}
