//
//  MainPageView.swift
//  Peer
//
//  Created by Hosung Lim on 3/29/24.
//

import SwiftUI

struct MainPageView: View {
	@EnvironmentObject var post: PostListVM
	@StateObject var showcase: ShowcaseVM = ShowcaseVM()

	@State var tabIndex = 0

	init() {
		UITabBar.appearance().backgroundColor = UIColor(Color("PrimaryBackground"))
	}

    var body: some View {
		ZStack {
			TabView(selection: $tabIndex) {
				PostListView()
					.tag(0)
					.tabItem {
						Label("모집글", systemImage: "house.fill")
					}

				HitchhikingView()
					.tag(1)
					.tabItem {
						Label("히치하이킹", systemImage: "rectangle.and.text.magnifyingglass")
					}

				ShowCaseView()
					.tag(2)
					.tabItem {
						Label("쇼케이스", systemImage: "medal")
					}
					.environmentObject(showcase)

				MyTeamView()
					.tag(3)
					.tabItem {
						Label("나의 팀", systemImage: "rectangle.grid.2x2")
					}

				SettingView()
					.tag(4)
					.tabItem {
						Label("마이프로필", systemImage: "house.fill")
					}
			}
		}
		.accentColor(Color("StrongPurple"))
    }
}

#Preview {
    MainPageView()
		.environmentObject(PostListVM())
}
