//
//  UICollectionViewExtension.swift
//  stashtest
//
//  Created by David Baez on 11/12/20.
//

import UIKit

protocol Reusable {
    static var reuseID: String { get }
}

extension UICollectionView {
    func dequeueReusableCell<T: Reusable>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.reuseID, for: indexPath) as! T
    }
}
