//
//  WireframeTests.swift
//  stashtestTests
//
//  Created by David Baez on 11/12/20.
//

import XCTest
@testable import stashtest

class WireframeTests: XCTestCase {

    func testWireframe() throws {
        let module = AchievementsWireframe.createAchievementsModule()
        
        XCTAssert(module is StashNavigationController)
        
        let nav = module as! StashNavigationController
        
        XCTAssert(nav.viewControllers[0] is AchievementsViewController)
        
        let achievementsVC = nav.viewControllers[0] as! AchievementsViewController
        
        XCTAssertNotNil(achievementsVC.presenter)
        
        let presenter = achievementsVC.presenter as! AchievementsPresenter
        
        XCTAssertNotNil(presenter.interactor)
        XCTAssertNotNil(presenter.wireframe)
    }
}
