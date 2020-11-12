//
//  AchievementPage.swift
//  stashtest
//
//  Created by David Baez on 11/9/20.
//

import Foundation

struct AchievementPage: Codable {
    let success: Bool
    let status: Int
    let overview: Overview
    let achievements: [Achievement]
}

struct Overview: Codable {
    let title: String
}
