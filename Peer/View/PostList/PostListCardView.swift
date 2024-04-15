//
//  PostListCardView.swift
//  Peer
//
//  Created by Hosung Lim on 4/1/24.
//

import SwiftUI

struct PostListCard: View {
	var post: PostList
	var body: some View {
		VStack(spacing: 0) {
			ZStack {
				VStack {
					AsyncImageView(
						bottomSharpen: true, imageUrl: post.image
					)
				}
				.frame(height: 220)
			}

			ZStack {
				Color.secondaryBackground
				VStack(alignment: .leading) {
					HStack {
						// 모집글의 메인 이미지
						AsyncProfileImageView(imageUrl: post.userThumbnail)
							.padding(10)

						// 모집글을 작성한 사람의 닉네임
						Text(post.userNickname)
							.font(.pretendardRegular16)
							.foregroundColor(.alternativeText)
							.frame(
								maxWidth: ScreenSize.screenWidth! - 40,
								alignment: .leading)
							.lineLimit(1)

						Spacer()

						HeartButton(isClicked: post.favorite) {}
					}
					.frame(width: ScreenSize.screenWidth! - 40, height: 50)

					// 모집글의 제목
					Text(post.title)
						.font(.pretendardMedium18)
						.foregroundColor(.strongText)
						.frame(maxWidth: .infinity, alignment: .leading)
						.lineLimit(1)
						.padding(10)

					// 모집글 태그
					HStack {
						ForEach(post.tagList.prefix(3), id: \.name) { tag in
							ZStack(alignment: .leading) {
								TagView(name: tag.name, color: tag.color)

							}
						}
						if post.tagList.count - 3 > 0 {
							Text("외 \(post.tagList.count - 3)개")
						}
					}
					.padding(10)
				}
				.frame(width: ScreenSize.screenWidth! - 40, height: 160)
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
			tagList: [
				Tag(tagId: 1, name: "test", color: "red", createdAt: nil, updatedAt: nil),
				Tag(tagId: 1, name: "test", color: "#FF00FF", createdAt: nil, updatedAt: nil),
				Tag(tagId: 1, name: "test", color: "red", createdAt: nil, updatedAt: nil),
				Tag(tagId: 1, name: "test", color: "red", createdAt: nil, updatedAt: nil),
				Tag(tagId: 1, name: "test", color: "red", createdAt: nil, updatedAt: nil),
				Tag(tagId: 1, name: "test", color: "red", createdAt: nil, updatedAt: nil),
				Tag(tagId: 1, name: "test", color: "red", createdAt: nil, updatedAt: nil),
				Tag(tagId: 1, name: "test", color: "red", createdAt: nil, updatedAt: nil),
				Tag(tagId: 1, name: "test", color: "red", createdAt: nil, updatedAt: nil)
			],
			favorite: false,
			recruitID: 1,
			updatedAt: "2024-01-25"
		)
	)
}
