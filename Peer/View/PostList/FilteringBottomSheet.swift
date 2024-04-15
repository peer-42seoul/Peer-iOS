//
//  FilteringBottomSheet.swift
//  Peer
//
//  Created by Hosung Lim on 4/12/24.
//

import SwiftUI

struct SearchBar: View {
	@State private var relativeTagSearchWord: String = ""
	@State private var isEditing: Bool = false
	var body: some View {
		HStack {
			TextField("검색중...", text: $relativeTagSearchWord)
				.padding(7)
				.padding(.horizontal, 25)
				.background(Color.tertiaryBackground)
				.overlay {
					HStack {
						Image(systemName: "magnifyingglass")
							.foregroundColor(.gray)
							.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
							.padding(.leading, 8)

						if isEditing {
							Button {
								self.relativeTagSearchWord = ""
							} label: {
								Image(systemName: "multiply.circle.fill")
									.foregroundColor(.gray)
									.padding(.trailing, 8)
							}

						}
					}
				}
				.padding(.horizontal, 10)
				.onTapGesture {
					self.isEditing = true
				}

			if isEditing {
				Button {
					self.isEditing = false
					relativeTagSearchWord = ""
				} label: {
					Text("Close")
				}
				.padding(.trailing, 10)
			}

			if isEditing {
				// TODO: 관련 태그 보여주는 창
			}
		}
	}
}

let optionList: [String] = [
	"옵션1", "옵션2", "옵션3", "옵션4", "옵션5", "옵션6", "옵션7", "옵션8"
]

struct FilteringBottomSheet: View {
	@Environment(\.presentationMode) var presentationMode
	@State private var timeToTakeFinish: Double = 0

	@State private var isRecruting: Bool = false
	@State private var isComplete: Bool = false

	@State private var region1: String = "해당없음"
	@State private var region2: String = ""

	@State private var isChecked1: Bool = false
	@State private var isChecked2: Bool = false
	@State private var isChecked3: Bool = false

	var body: some View {
		ZStack {
			Color.secondaryBackground
			VStack {
				HStack {
					Text("맞춤 스터디를 찾아보세요!")
						.font(.pretendardBold18)
						.foregroundColor(.normalText)
					Spacer()
					Button(action: {
						presentationMode.wrappedValue.dismiss()
					}, label: {
						Image(systemName: "xmark")
							.font(.pretendardMedium18)
					})
				}
				.padding(20)

				VStack(spacing: 20) {
					VStack {
						Text("관련 태그")
							.font(.pretendardBold18)
							.frame(maxWidth: .infinity, alignment: .leading)
						SearchBar()
					}

					VStack {
						Text("목표시간")
							.font(.pretendardBold18)
							.frame(maxWidth: .infinity, alignment: .leading)
						// 더블 슬라이더 구현
						Slider(value: $timeToTakeFinish, in: 0...100, step: 16)
					}

					VStack {
						Text("모집 상태")
							.font(.pretendardBold18)
							.frame(maxWidth: .infinity, alignment: .leading)
						HStack(spacing: 20) {
							Toggle("모집 중", isOn: $isRecruting)
								.toggleStyle(SwitchToggleStyle(tint: .accent))
								.font(.pretendardRegular16)
								.frame(width: 110)

							Toggle("모집 완료", isOn: $isComplete)
								.toggleStyle(SwitchToggleStyle(tint: .accent))
								.font(.pretendardRegular16)
								.frame(width: 130)
							Spacer()

						}
					}

					VStack {
						Text("활동 지역")
							.font(.pretendardBold18)
							.frame(maxWidth: .infinity, alignment: .leading)

						HStack {
							VStack {
								Menu {
									ForEach(optionList, id: \.self) { option in
										Button(option) {
											region1 = option
										}
									}
								} label: {
									HStack {
										Text(region1)
											.font(.pretendardRegular16)
											.foregroundColor(.normalText)
										Spacer()
										Image(systemName: "chevron.down")
									}
								}
								.padding(20)
								.frame(height: 40)
							}
							.background(Color.tertiaryBackground)

							VStack {
								Menu {
									ForEach(optionList, id: \.self) { option in
										Button(option) {
											region2 = option
										}
									}
								} label: {
									HStack {
										Text(region2)
											.font(.pretendardRegular16)
											.foregroundColor(.normalText)
										Spacer()
										Image(systemName: "chevron.down")
									}
								}
								.padding(20)
								.frame(height: 40)
							}
							.background(Color.tertiaryBackground)
						}

					}

					VStack {
						Text("활동 방식")
							.font(.pretendardBold18)
							.frame(maxWidth: .infinity, alignment: .leading)

						HStack {
							Button(action: {
								isChecked1.toggle()
							}, label: {
								HStack {
									Image(systemName: isChecked1 ? "checkmark.square" : "square")
										.foregroundColor(isChecked1 ? .accent : .gray)
									Text("온라인")
										.font(.pretendardMedium16)
										.foregroundColor(.normalText)
								}
								.padding()
							})

							Button(action: {
								isChecked2.toggle()
							}, label: {
								HStack {
									Image(systemName: isChecked2 ? "checkmark.square" : "square")
										.foregroundColor(isChecked2 ? .accent : .gray)
									Text("오프라인")
										.font(.pretendardMedium16)
										.foregroundColor(.normalText)
								}
								.padding()
							})

							Button(action: {
								isChecked3.toggle()
							}, label: {
								HStack {
									Image(systemName: isChecked3 ? "checkmark.square" : "square")
										.foregroundColor(isChecked3 ? .accent : .gray)
									Text("혼합")
										.font(.pretendardMedium16)
										.foregroundColor(.normalText)
								}
								.padding()
							})
							Spacer()
						}
					}
					Spacer()
				}
				.padding(20)
			}
		}
	}
}

#Preview {
	FilteringBottomSheet()
}
