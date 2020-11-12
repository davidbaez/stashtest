//
//  InteractorTest.swift
//  stashtestTests
//
//  Created by David Baez on 11/12/20.
//

import XCTest
@testable import stashtest

class InteractorTests: XCTestCase {
    
    class MockPresenter: AchievementsModuleInterface, AchievementsInteractorOutput {

        var interactor: AchievementsInteractorInput!
        
        var achievementPage: AchievementPage?
        
        func updateView() {
            self.interactor.fetchAchievements()
        }
        
        func showDetailsForAchievement(achievement: Achievement) {}
        
        func achievementPageFetched(achievementPage: AchievementPage?) {
            self.achievementPage = achievementPage
        }
    }
    
    func testInteractor() throws {
        let presenter = MockPresenter()
        let interactor = AchievementsInteractor()
        
        presenter.interactor = interactor
        interactor.output = presenter
        
        self.measure {
            presenter.updateView()
        }
        
        XCTAssertNotNil(presenter.achievementPage)
    }
}
