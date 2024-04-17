//
//  HitchhikingView.swift
//  Peer
//
//  Created by Hosung Lim on 3/29/24.
//

import SwiftUI

struct HitchHikingHeaderView: View {
	var body: some View {
		HStack {
			Text("히치하이킹")
				.font(.pretendardBold24)

			Spacer()
		}
	}
}

struct HitchHikingCardStack<Content: View, Item: RandomAccessCollection>: View where Item.Element: Identifiable  {
	var isRotated: Bool = false
	var items: Item
	var content: (Item.Element) -> Content

	var body: some View {
		GeometryReader {
			Color("PrimaryBackground")
				.ignoresSafeArea()

			let size = $0.size
			TabView {
				ForEach(Array(items.enumerated()), id: \.element.id) { index, showcase in
					content(showcase)
						.frame(
							width: size.width - 10,
							height: size.height)
						.rotationEffect(.degrees(-90))
						.onAppear {
							if index == items.count - 2 {
								Task {

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

struct HitchHikingCardView: View {
	var card: Hitchhiking

	var body: some View {
		ZStack {
			Color.secondaryBackground
			VStack(alignment: .leading) {
				ShowcaseCardImageView(imageUrl: card.image)
					.frame(height: 350)
				HStack {
					AsyncProfileImageView(imageUrl: card.authorImage)

					Text(card.teamName)
						.font(.pretendardMedium18)
						.foregroundColor(.alternativeText)

					Spacer()
					// TODO: 좋아요 버튼
					// TODO: 관심목록 추가 버튼
				}

				HStack {
					Text(card.title)
						.font(.pretendardMedium16)
						.lineLimit(3)
				}
				.frame(height: 80, alignment: .top)

				VStack(spacing: 10) {
//					HStack {
//						Label("시작일", systemImage: "calendar")
//							.font(.pretendardRegular16)
//						Text(card.)
//							.font(.pretendardRegular16)
//						Spacer()
//					}
//					HStack {
//						Label("종료일", systemImage: "calendar")
//							.font(.pretendardRegular16)
//						Text(card.end)
//							.font(.pretendardRegular16)
//						Spacer()
//					}

					HStack {
						Label("기술스택", systemImage: "tag")
							.font(.pretendardRegular16)

						if !card.tagList.isEmpty {
							PostDetailTagList(tagList: card.tagList)
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

struct HitchhikingView: View {
	@EnvironmentObject var hitch: HitchhikingVM
	var body: some View {
		ZStack {
			Color("PrimaryBackground")
				.ignoresSafeArea()

			VStack(alignment: .center) {

				HitchHikingHeaderView()
					.padding(20)

				NavigationStack {
					VStack {
						HitchHikingCardStack(
							items: hitch.hitchhikingModel.hitchhikings
						) { item in
							HitchHikingCardView(
								card: item
							)
							.padding(10)
						}
					}
				}

				Spacer()
			}
		}
		.onAppear {
			Task {
				await hitch.process(intent: .initialize)
			}
		}
	}
}

#Preview {
	HitchhikingView()
		.environmentObject(HitchhikingVM())
}
