//
//  Achievement.swift
//  stashtest
//
//  Created by David Baez on 11/9/20.
//

import Foundation

struct Achievement: Codable {
    let id: Int
    let level: String
    let progress: Int
    let total: Int
    let bg_image_url: String
    let accessible: Bool
}
