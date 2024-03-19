//
//  SplashView.swift
//  Peer
//
//  Created by Hosung Lim on 3/18/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
		ZStack {
			Color("StrongPurple")

			HStack {

				Image("Icon")
					.resizable()
					.frame(width: 100, height: 100)
					.scaledToFit()

				VStack(alignment: .leading) {
					Text("Peer")
						.font(.title)
						.bold()
						.foregroundColor(.white)

					Text("in your hand")
						.font(.body)
						.bold()
						.foregroundColor(.white)
				}

			}

		}
		.ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
