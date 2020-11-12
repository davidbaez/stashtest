//
//  EntitiesTest.swift
//  stashtestTests
//
//  Created by David Baez on 11/12/20.
//

import XCTest
@testable import stashtest

class EntitiesTests: XCTestCase {

    func testAchievementEntity() throws {
        let json: [String: Any] = [
            "id": 9,
            "level": "4",
            "progress": 25,
            "total": 100,
            "bg_image_url": "",
            "accessible": true
        ]
        
        do {
            let decoder = JSONDecoder()
            let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let achievement = try decoder.decode(Achievement.self, from: jsonData)
            
            XCTAssert(achievement.id == 9)
            XCTAssert(achievement.level == "4")
            XCTAssert(achievement.progress == 25)
            XCTAssert(achievement.total == 100)
            XCTAssert(achievement.bg_image_url == "")
            XCTAssertTrue(achievement.accessible)

        } catch {
            print("error:\(error)")
            throw error
        }
    }
    
    func testAchievementPageEntity() throws {
        let json: [String: Any] = [
            "success": true,
            "status": 200,
            "overview": [
                "title": "Stash"
            ],
            "achievements": [
                [
                    "id": 11,
                    "level": "5",
                    "progress": 50,
                    "total": 50,
                    "bg_image_url": "",
                    "accessible": true
                ]
            ]
        ]
        
        do {
            let decoder = JSONDecoder()
            let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let achievementPage = try decoder.decode(AchievementPage.self, from: jsonData)
            
            XCTAssertTrue(achievementPage.success)
            XCTAssert(achievementPage.status == 200)
            XCTAssert(achievementPage.overview.title == "Stash")
            
            XCTAssertNotNil(achievementPage.achievements.first)
            
            let achievement = achievementPage.achievements.first!
            
            XCTAssert(achievement.id == 11)
            XCTAssert(achievement.level == "5")
            XCTAssert(achievement.progress == 50)
            XCTAssert(achievement.total == 50)
            XCTAssert(achievement.bg_image_url == "")
            XCTAssertTrue(achievement.accessible)

        } catch {
            print("error:\(error)")
            throw error
        }
    }
}
