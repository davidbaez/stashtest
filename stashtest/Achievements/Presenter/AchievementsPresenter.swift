//
//  AchievementsPresenter.swift
//  stashtest
//
//  Created by David Baez on 11/10/20.
//

import Foundation


protocol AchievementsModuleInterface: class {
    func updateView()
    func showDetailsForAchievement(achievement: Achievement)
}

protocol AchievementsInteractorOutput: class {
    func achievementPageFetched(achievementPage: AchievementPage?)
}

class AchievementsPresenter {
    weak var view: AchievementsViewInterface!

    var interactor: AchievementsInteractorInput!

    var wireframe: AchievementsWireframeInput!
}

extension AchievementsPresenter: AchievementsModuleInterface {
    func updateView() {
        self.interactor.fetchAchievements()
    }
    
    func showDetailsForAchievement(achievement: Achievement) {
        self.wireframe.presentAchievementsDetails(achievement: achievement)
    }
}

extension AchievementsPresenter: AchievementsInteractorOutput {
    func achievementPageFetched(achievementPage: AchievementPage?) {
        if let achievementPage = achievementPage {
            self.view.showAchievementsData(achievementPage: achievementPage)
        } else {
            self.view.showNoContentScreen()
        }
    }
}
