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
				// 디테일뷰 Header
				ScrollView {
					VStack {
						Text("스터디 or 프로젝트") 
						// TODO: - API 수정 필요
						HStack(alignment: .center) {
							Text(postDetailModel.postDetail.title)
								.font(.pretendardBold28)
								.frame(
									alignment: .leading)
								.lineLimit(1)
							Spacer()
							// TODO: - 상태에 맞는 태그 필요
							Text(postDetailModel.postDetail.status)
						}
						// 모집글의 이미지
						AsyncImageView(imageUrl: postDetailModel.postDetail.image)

						// 팀장의 프로필 정보와 메세지 보내기 버튼
						PostDetailLeader(
							imageUrl: postDetailModel.postDetail.leaderImage,
							nickname: postDetailModel.postDetail.leaderNickname)
					}
					Divider()
						.frame(height: 3)
						.overlay(Color.gray.opacity(0.4))

					VStack(spacing: 16) {
						// 팀명에 대한 설명
						PostDetailTeamName(teamName: postDetailModel.postDetail.teamName)

						// 팀 인원에 대한 설명
						PostDetailHeadCount(
							currentCount: postDetailModel.postDetail.current,
							totalCount: postDetailModel.postDetail.totalNumber)

						// 활동 방식에 대한 설명
						PostDetailActType(actType: postDetailModel.postDetail.place)

						// 목표 시간에 대한 설명
						PostDetailDue(due: postDetailModel.postDetail.due)

						// 활동 지역에 대한 설명
						PostDetailRegion(
							region0: postDetailModel.postDetail.region?[0],
							region1: postDetailModel.postDetail.region?[1]
						)

						// 관련 태그 모음
						PostDetailTagList(tagList: postDetailModel.postDetail.tagList)

						// 모집글을 설명하는 부분
						PostDetailContent(content: postDetailModel.postDetail.content)
					}
				}
				.scrollIndicators(.hidden)
				.padding(.horizontal)
				// 디테일뷰 Body
				Spacer()

				HStack(alignment: .center, spacing: 10) {
                    // TODO: - 지원확인 모달 및 인터뷰 페이지로
                    PurpleButton(
                        disable: postDetailModel.postDetail.status == "RECRUIT",
                        text: "지원하기",
                        action: {}
                    )

					HeartButton(isClicked: postDetailModel.postDetail.favorite) {
						// TODO: - 좋아요 API
					}
					.frame(width: 50)
				}
			}
		}
		.toolbar(content: {
			MoreButton {
				// TODO: - 눌렀을 때 설정 보이게, 아마 bottomsheet?
			}
			.frame(width: 50)
		})
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
	PostDetailView(postId: 107)
}
