//
//  PostDetailInfoView.swift
//  Peer
//
//  Created by Hosung Lim on 4/10/24.
//

import SwiftUI

struct PostDetailLeader: View {
	var imageUrl: String?
	var nickname: String
	var body: some View {
		HStack {
			AsyncProfileImageView(imageUrl: imageUrl)

			Text(nickname)
				.font(.pretendardMedium18)
				.frame(
					maxWidth: 130,
					alignment: .leading)
				.lineLimit(1)
			Spacer()
			MessageButton {
				// TODO: - 메세지 API 붙이기
			}
			.frame(width: 50)
			.clipShape(
				Circle()
			)
		}
	}
}

struct PostDetailTeamName: View {
	var teamName: String
	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			HStack(alignment: .center) {
				Label("팀명", systemImage: "person")
					.font(.pretendardBold18)
					.frame(
						maxWidth: .infinity,
						alignment: .leading)
			}
			Text(teamName)
				.font(.pretendardMedium16)
				.foregroundColor(.alternativeText)
		}
	}
}

struct PostDetailHeadCount: View {
	var currentCount: Int?
	var totalCount: Int
	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			HStack(alignment: .center) {
				Label("인원", systemImage: "person.2.fill")
					.font(.pretendardBold18)
					.frame(
						maxWidth: .infinity,
						alignment: .leading)
			}
			Text("\(currentCount ?? 0)/\(totalCount)명")
				.font(.pretendardMedium16)
				.foregroundColor(.alternativeText)
		}
	}
}

struct PostDetailActType: View {
	var actType: String
	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			HStack(alignment: .center) {
				Label("활동 방식", systemImage: "wifi")
					.font(.pretendardBold18)
					.frame(
						maxWidth: .infinity,
						alignment: .leading)
			}
			Text(actType)
				.font(.pretendardMedium16)
				.foregroundColor(.alternativeText)
		}
	}
}

struct PostDetailDue: View {
	var due: String

	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			HStack(alignment: .center) {
				Label("목표시간", systemImage: "clock")
					.font(.pretendardBold18)
					.frame(
						maxWidth: .infinity,
						alignment: .leading)
			}
			Text(due)
				.font(.pretendardMedium16)
				.foregroundColor(.alternativeText)
		}
	}
}

struct PostDetailRegion: View {
	var region0: String?
	var region1: String?
	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			HStack(alignment: .center) {
				Label("지역", systemImage: "location.fill")
					.font(.pretendardBold18)
					.frame(
						maxWidth: .infinity,
						alignment: .leading)
			}
			Text("\(region0 ?? "없음") \(region1 ?? "")")
				.font(.pretendardMedium16)
				.foregroundColor(.alternativeText)
		}
	}
}

struct PostDetailTagList: View {
	var tagList: [Tag]
	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			HStack(alignment: .center) {
				Label("관련 태그", systemImage: "tag")
					.font(.pretendardBold18)
					.frame(
						maxWidth: .infinity,
						alignment: .leading)
			}

			ScrollView(.horizontal) {
				HStack {
					ForEach(tagList, id: \.color) { tag in
						TagView(name: tag.name, color: tag.color)
					}
				}
			}
		}
	}
}

struct PostDetailContent: View {
	var content: String
	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			HStack(alignment: .center) {
				Label("설명", systemImage: "note.text")
					.font(.pretendardBold18)
					.frame(
						maxWidth: .infinity,
						alignment: .leading)
			}
			ZStack {
				Color.secondaryBackground
				if let attributedString = try? AttributedString(
					markdown: content,
					options: .init(interpretedSyntax: .inlineOnlyPreservingWhitespace)
				) {
					Text(attributedString)
						.font(.pretendardRegular16)
						.padding(8)
				} else {
					// 마크다운 파싱 실패 시 대체 텍스트 표시
					Text("마크다운을 렌더링할 수 없습니다.")
						.font(.pretendardRegular16)
						.padding(8)
				}
			}
			.clipShape(
				.rect(cornerRadius: 15, style: .continuous)
			)
		}
	}
}
