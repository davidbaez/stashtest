//
//  StoryboardExtension.swift
//  stashtest
//
//  Created by David Baez on 11/12/20.
//

import UIKit

extension UIStoryboard {
    enum Storyboard: String {
        case main = "Main"
        case achievements = "Achievements"
    }
    
    class func get(type: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: type.rawValue, bundle: bundle)
    }
}

protocol StoryboardIdentifiable {
    static var storyboard: UIStoryboard.Storyboard { get }
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable {
    static func instantiate<T: StoryboardIdentifiable>() -> T {
        let storyboard = UIStoryboard.get(type: T.storyboard)
        return storyboard.instantiateViewController(withIdentifier: T.storyboardIdentifier) as! T
    }
}
