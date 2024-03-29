//
//  TeamDetailIntent.swift
//  Peer
//
//  Created by Hosung Lim on 3/28/24.
//

import Foundation

enum TeamDetailIntent {
	case showMain

	case showTeamNoti
	case createTeamNoti
	case editTeamNoti
	case deleteTeamNoti
	case searchTeamNoti

	case showTeamPost
	case createTeamPost
	case editTeamPost
	case deleteTeamPost
	case searchTeamPost
	case moveTeamPostCategory

	case showTeamSetting
	case showRecruitPost
	case editTeamImage
	case editTeamName
	case editTeamStatus
	case editTeamDue
	case editTeamAction
	case editTeamLocation
	case save

	case exitTeam
	case breakUpTeam
	case completeTeam

	case changeMemberAuth
	case kickOffMember
	case showMemberProfile
	case sendMessageToMember
	case reportMember

	case showWaiting
	case showNext
	case showPrev
	case accept
	case deny

	case showShowcase
	case createShowcase
	case editShowcase
}
