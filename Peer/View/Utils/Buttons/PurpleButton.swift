//
//  PurpleButton.swift
//  Peer
//
//  Created by Hosung Lim on 6/7/24.
//

import SwiftUI

struct PurpleButton: View {
    var disable: Bool
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .frame(maxWidth: 270, minHeight: 40)
        }
        .buttonStyle(.borderedProminent)
        .disabled(disable)
    }
}

#Preview {
    PurpleButton(
        disable: false, text: "테스트", action: {}
    )
}
