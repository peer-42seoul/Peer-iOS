//
//  PostListCardView.swift
//  Peer
//
//  Created by Hosung Lim on 4/1/24.
//

import SwiftUI

struct PostListImageView: View {
	var imageUrl: String
	var body: some View {
		AsyncImage(url: URL(string: imageUrl)) { image in
			image
				.resizable()
				.aspectRatio(1.75, contentMode: .fit)
				.frame(width: .infinity, height: 225)
				.scaledToFill()
				.clipShape(.rect(
					topLeadingRadius: 24,
					bottomLeadingRadius: 0,
					bottomTrailingRadius: 0,
					topTrailingRadius: 24
				))
		} placeholder: {
			ProgressView()
		}
	}
}

struct PostListProfileImageView: View {
	var imageUrl: String?
	var body: some View {
		if imageUrl != nil {
			AsyncImage(url: URL(string: imageUrl!)) { image in
				image
					.resizable()
					.frame(width: 50, height: 50)
					.cornerRadius(50.0)
			} placeholder: {
				ProgressView()
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

struct PostListCard: View {
	var post: PostList
	var body: some View {
		VStack {
			ZStack {
				VStack {
					PostListImageView(imageUrl: post.image)
				}
				.frame(height: 225)
			}

			ZStack {
				Color.secondaryBackground
				VStack(alignment: .leading) {
					HStack {
						// 모집글의 메인 이미지
						PostListProfileImageView(imageUrl: post.userThumbnail)

						// 모집글을 작성한 사람의 닉네임
						Text(post.userNickname)
							.font(.pretendardRegular16)
							.foregroundColor(.alternativeText)
							.frame(maxWidth: .infinity, alignment: .leading)
							.lineLimit(1)

						Spacer()

						Button {
							// 실행할 코드
						} label: {
							Image(systemName: post.favorite ? "heart.fill" : "heart")
								.resizable()
								.scaledToFit()

						}
						.padding(10)



					}
					.frame(width: ScreenSize.screenWidth, height: 50)

					// 모집글의 제목
					Text(post.title)
						.font(.pretendardMedium18)
						.foregroundColor(.strongText)
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(10)

					// 모집글 태그
				}
				.frame(width: ScreenSize.screenWidth, height: 140)
			}
			.clipShape(.rect(
				topLeadingRadius: 0,
				bottomLeadingRadius: 24,
				bottomTrailingRadius: 24,
				topTrailingRadius: 0
			))
		}
	}
}
#Preview {
	PostListCard(
		post: PostList(
			title: "test",
			image: "test",
			userID: 1,
			userNickname: "test",
			userThumbnail: nil,
			status: "BEFORE",
			tagList: [],
			favorite: false,
			recruitID: 1,
			updatedAt: "2024-01-25"
		)
	)
}
