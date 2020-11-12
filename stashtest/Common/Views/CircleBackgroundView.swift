//
//  CircleBackgroundView.swift
//  stashtest
//
//  Created by David Baez on 11/11/20.
//

import UIKit

class CircleBackgroundView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.size.width / 2
        layer.masksToBounds = true
    }
}
