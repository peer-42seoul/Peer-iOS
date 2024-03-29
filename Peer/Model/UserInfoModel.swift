//
//  UserInfoModel.swift
//  Peer
//
//  Created by Hosung Lim on 3/20/24.
//

import Foundation

// 유저의 기본 정보
struct UserInfomationModel: Codable {
	var nickname: String
	var userID: Int
	// 유저의 로그인 정보
	var isSignIn: Bool
}
