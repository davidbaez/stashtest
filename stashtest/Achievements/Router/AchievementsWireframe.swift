//
//  AchievementsWireframe.swift
//  stashtest
//
//  Created by David Baez on 11/10/20.
//

import Foundation
import UIKit

protocol AchievementsWireframeInput {
    static func createAchievementsModule() -> UIViewController
    func presentAchievementsDetails(achievement: Achievement)
}

class AchievementsWireframe {}

extension AchievementsWireframe: AchievementsWireframeInput {
    class func createAchievementsModule() -> UIViewController {
        let viewController: AchievementsViewController = AchievementsViewController.instantiate()
        let presenter = AchievementsPresenter()
        let interactor = AchievementsInteractor()
        let wireframe = AchievementsWireframe()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.output = presenter
        
        let navigation = StashNavigationController(rootViewController: viewController)
        
        return navigation
    }
    
    func presentAchievementsDetails(achievement: Achievement) {
        // TODO: LATER
        print("Presenting Details for achievement level \(achievement.level)")
    }
}
