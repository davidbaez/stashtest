//
//  PresenterTests.swift
//  stashtestTests
//
//  Created by David Baez on 11/12/20.
//

import XCTest
@testable import stashtest

class PresenterTests: XCTestCase {
    
    class MockView: AchievementsViewInterface {
        var presenter: AchievementsModuleInterface!
        
        var achievements: [Achievement]? = nil
        
        func showAchievementsData(achievementPage: AchievementPage) {
            self.achievements = achievementPage.achievements
        }
        
        func showNoContentScreen() {
            self.achievements = nil
        }
    }
    
    class MockInteractor: AchievementsInteractorInput {
        
        weak var output: AchievementsInteractorOutput!
        
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
        
        func fetchAchievements() {
            do {
                let decoder = JSONDecoder()
                let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                let achievementPage = try decoder.decode(AchievementPage.self, from: jsonData)
                
                self.output.achievementPageFetched(achievementPage: achievementPage)
            } catch {
                print("error:\(error)")
            }
        }
    }
    
    func testWithMockInteractor() throws {
        let viewController = MockView()
        let presenter = AchievementsPresenter()
        let interactor = MockInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        interactor.output = presenter
        
        viewController.presenter.updateView()
        
        XCTAssertNotNil(viewController.achievements)
    }
}
