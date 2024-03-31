//
//  MainBodyView.swift
//  Peer
//
//  Created by Hosung Lim on 3/29/24.
//

import SwiftUI

struct PostListBody: View {
	@EnvironmentObject var postVm: PostListVM

	var body: some View {
		ScrollView {
			LazyVStack(spacing: 30) {
				ForEach(postVm.postListModel.posts, id: \.title) { post in
					PostListCard(post: post)
						.cornerRadius(10.0)
						.border(Color.assisitiveText, width: 2)
						.padding(10)
				}
			}
		}
		.scrollIndicators(.hidden)
	}
}

struct PostListCard: View {
	var post: PostList
	var body: some View {
		VStack {
			ZStack {
				VStack {
					AsyncImage(url: URL(string: post.image)) { image in
						image
							.resizable()
							.aspectRatio(1.75, contentMode: .fit)
							.frame(width: .infinity, height: 190)
							.scaledToFill()
					} placeholder: {
						ProgressView()
					}
				}
				.frame(height: 190)
			}


			VStack(alignment: .leading) {
				HStack {
					if post.userThumbnail != nil {
						AsyncImage(url: URL(string: post.userThumbnail!)) { image in
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

					Text(post.userNickname)
						.font(.subheadline)
						.foregroundColor(.assisitiveText)
						.frame(maxWidth: .infinity, alignment: .leading)
						.lineLimit(1)
				}
				.frame(width: ScreenSize.screenWidth)

				Text(post.title)
					.font(.title2)
					.foregroundColor(.strongText)
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(10)
			}
			.frame(width: ScreenSize.screenWidth, height: 120)


		}
	}
}

#Preview {
	PostListBody()
		.environmentObject(PostListVM())
}
