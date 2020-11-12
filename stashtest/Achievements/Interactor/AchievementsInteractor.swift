//
//  AchievementsInteractor.swift
//  stashtest
//
//  Created by David Baez on 11/9/20.
//

import Foundation

protocol AchievementsInteractorInput: class {
    func fetchAchievements()
}

class AchievementsInteractor {
    // Reference to the Presenter's output interface.
    weak var output: AchievementsInteractorOutput!
}

extension AchievementsInteractor: AchievementsInteractorInput {
    func fetchAchievements() {
        guard let url = Bundle.main.url(forResource: "achievements", withExtension: "json") else {
            self.output.achievementPageFetched(achievementPage: nil)
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let achievementPage = try JSONDecoder().decode(AchievementPage.self, from: data)
            
            guard achievementPage.success else {
                self.output.achievementPageFetched(achievementPage: nil)
                return
            }
            
            self.output.achievementPageFetched(achievementPage: achievementPage)
        } catch {
            print("error:\(error)")
            self.output.achievementPageFetched(achievementPage: nil)
        }
    }
}
