//
//  PostDetailView.swift
//  Peer
//
//  Created by Hosung Lim on 4/1/24.
//

import SwiftUI

struct PostDetailView: View {
	@StateObject var postDetailModel: PostDetailVM = PostDetailVM()
	var postId: Int

	var body: some View {
		ZStack {
			Color(.primaryBackground)
				.ignoresSafeArea()
			VStack {
				HStack {
					Spacer()
					HeartButton(isClicked: postDetailModel.postDetail.favorite) {

					}
					.frame(width: 50)

					MoreButton {

					}
					.frame(width: 50)
				}
				.frame(height: 60)
				// 디테일뷰 Header
				ScrollView {
					VStack {
						Text("스터디 or 프로젝트") // API 수정 필요
						HStack(alignment: .center) {
							Text(postDetailModel.postDetail.title)
								.font(.pretendardBold28)
								.frame(
									alignment: .leading)
								.lineLimit(1)
							Spacer()
							Text(postDetailModel.postDetail.status)
						}
						// 모집글의 이미지
						AsyncImageView(imageUrl: postDetailModel.postDetail.image)
							.clipShape(.rect(
								topLeadingRadius: 24,
								bottomLeadingRadius: 24,
								bottomTrailingRadius: 24,
								topTrailingRadius: 24
							))

						HStack {
							// 팀장의 프로필 정보와 메세지 보내기
							AsyncProfileImageView(imageUrl: postDetailModel.postDetail.leaderImage)
							Text(postDetailModel.postDetail.leaderNickname)
								.font(.pretendardMedium18)
								.frame(
									maxWidth: 130,
									alignment: .leading)
								.lineLimit(1)
							Spacer()
							MessageButton {

							}
							.frame(width: 50)
							.clipShape(
								Circle()
							)
						}
					}
					Divider()
						.frame(height: 3)
						.overlay(Color.gray.opacity(0.4))

					VStack(spacing: 16) {
						VStack(alignment: .leading, spacing: 8) {
							HStack(alignment: .center) {
								Image(systemName: "person")
									.font(.pretendardBold18)
								Text("팀명")
									.font(.pretendardBold18)
									.frame(
										maxWidth: .infinity,
										alignment: .leading)
							}
							Text(postDetailModel.postDetail.teamName)
								.font(.pretendardMedium16)
								.foregroundColor(.alternativeText)
						}

						VStack(alignment: .leading, spacing: 8) {
							HStack(alignment: .center) {
								Image(systemName: "person.2.fill")
									.font(.pretendardBold18)

								Text("인원")
									.font(.pretendardBold18)
									.frame(
										maxWidth: .infinity,
										alignment: .leading)
							}
							Text("\(postDetailModel.postDetail.current ?? 0)/\(postDetailModel.postDetail.totalNumber)명")
								.font(.pretendardMedium16)
								.foregroundColor(.alternativeText)
						}

						VStack(alignment: .leading, spacing: 8) {
							HStack(alignment: .center) {
								Image(systemName: "wifi")
									.font(.pretendardBold18)

								Text("활동 방식")
									.font(.pretendardBold18)
									.frame(
										maxWidth: .infinity,
										alignment: .leading)
							}
							Text(postDetailModel.postDetail.place)
								.font(.pretendardMedium16)
								.foregroundColor(.alternativeText)
						}

						VStack(alignment: .leading, spacing: 8) {
							HStack(alignment: .center) {
								Image(systemName: "clock")
									.font(.pretendardBold18)

								Text("목표시간")
									.font(.pretendardBold18)
									.frame(
										maxWidth: .infinity,
										alignment: .leading)
							}
							Text(postDetailModel.postDetail.due)
								.font(.pretendardMedium16)
								.foregroundColor(.alternativeText)
						}

						VStack(alignment: .leading, spacing: 8) {
							HStack(alignment: .center) {
								Image(systemName: "location.fill")
									.font(.pretendardBold18)

								Text("지역")
									.font(.pretendardBold18)
									.frame(
										maxWidth: .infinity,
										alignment: .leading)
							}
							Text("\(postDetailModel.postDetail.region?[0] ?? "없음") \(postDetailModel.postDetail.region?[1] ?? "")")
								.font(.pretendardMedium16)
								.foregroundColor(.alternativeText)
						}

						VStack(alignment: .leading, spacing: 8) {
							HStack(alignment: .center) {
								Image(systemName: "tag")
									.font(.pretendardBold18)

								Text("관련 태그")
									.font(.pretendardBold18)
									.frame(
										maxWidth: .infinity,
										alignment: .leading)
							}
							HStack {
								ForEach(postDetailModel.postDetail.tagList, id: \.color) { tag in
									Text(tag.name)
										.font(.pretendardMedium16)
										.foregroundColor(.alternativeText)
								}
							}
						}

						VStack(alignment: .leading, spacing: 8) {
							HStack(alignment: .center) {
								Image(systemName: "note.text")
									.font(.pretendardBold18)

								Text("설명")
									.font(.pretendardBold18)
									.frame(
										maxWidth: .infinity,
										alignment: .leading)
							}

							

							if let attributedString = try? AttributedString(
								markdown: postDetailModel.postDetail.content,
								options: .init(interpretedSyntax: .inlineOnlyPreservingWhitespace)
							) {
								Text(attributedString)
									.font(.pretendardRegular16)
							} else {
								// 마크다운 파싱 실패 시 대체 텍스트 표시
								Text("마크다운을 렌더링할 수 없습니다.")
									.font(.pretendardRegular16)
							}

						}

					}
				}
				.padding(.horizontal)
				// 디테일뷰 Body
				Spacer()
			}
		}
		.onAppear {
			Task {
				await postDetailModel.process(intent: .open)
			}
		}
	}

	init(postId: Int) {
		self.postId = postId
		_postDetailModel = StateObject(wrappedValue: PostDetailVM(id: postId))
	}
}

#Preview {
	PostDetailView(postId: 106)
}
