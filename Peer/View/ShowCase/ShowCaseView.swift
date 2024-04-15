//
//  ShowCaseView.swift
//  Peer
//
//  Created by Hosung Lim on 3/29/24.
//

import SwiftUI

struct ShowCaseView: View {
    var body: some View {
		ZStack {
			Color.primaryBackground
			VStack(alignment: .center) {
				// Header
				ShowCaseHeaderView()
					.padding(20)
				Spacer()
				// Body

			}
		}
    }
}

struct ShowCaseBodyView: View {
	var body: some View {
		ZStack {
			VStack {
				
			}
		}
	}
}

struct ShowCaseHeaderView: View {
	var body: some View {
		HStack {
			Text("쇼케이스")
				.font(.pretendardBold24)
		}
	}
}

#Preview {
    ShowCaseView()
}
