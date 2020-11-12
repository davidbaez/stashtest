//
//  StashNavigationController.swift
//  stashtest
//
//  Created by David Baez on 11/11/20.
//

import UIKit

class StashNavigationController: UINavigationController {
    override func viewDidLoad() {
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationBar.titleTextAttributes = textAttributes
        self.navigationBar.barTintColor = UIColor.stashPurple
    }
}
