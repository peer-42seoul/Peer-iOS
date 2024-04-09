//
//  DocumentExtension.swift
//  Peer
//
//  Created by Hosung Lim on 4/9/24.
//

import Foundation

extension Document {
	// Document를 SwiftUI Text로 변환하는 메서드
	func renderMarkdownToText() -> Text {
		// 여기서는 단순화를 위해 모든 요소를 단일 Text로 처리합니다.
		// 실제로는 마크다운 요소별로 다른 스타일을 적용할 수 있습니다.
		var resultText = Text("")

		for block in self.children {
			switch block {
			case let paragraph as Paragraph:
				for inline in paragraph.children {
					switch inline {
					case let text as Text:
						resultText = resultText + Text(text.string)
					case let strong as Strong:
						let strongText = strong.children.compactMap({ $0 as? Text }).map({ $0.string }).joined()
						resultText = resultText + Text(strongText).bold()
					case let emphasis as Emphasis:
						let emphasisText = emphasis.children.compactMap({ $0 as? Text }).map({ $0.string }).joined()
						resultText = resultText + Text(emphasisText).italic()
					default:
						break
					}
				}
				resultText = resultText + Text("\n")
			default:
				break
			}
		}

		return resultText
	}
}
