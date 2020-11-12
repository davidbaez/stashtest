//
//  AchievementCollectionViewCell.swift
//  stashtest
//
//  Created by David Baez on 11/10/20.
//

import UIKit
import AlamofireImage

extension AchievementCollectionViewCell: Reusable {
    static var reuseID: String {
        return "AchievementCollectionViewCell"
    }
}

class AchievementCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var levelBackgroundView: CircleBackgroundView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func setup(achievement: Achievement) {
        self.imageView.image = nil
        self.contentView.layer.cornerRadius = 8
        progressView.layer.cornerRadius = 4.5
        
        levelLabel.text = achievement.level
        progressLabel.text = "\(achievement.progress)pts"
        totalLabel.text = "\(achievement.total)pts"
        progressView.progress = Float(achievement.progress) / Float(achievement.total)
        imageView.backgroundColor = .black
        
        if achievement.accessible {
            isUserInteractionEnabled = true
            contentView.alpha = 1.0
        } else {
            isUserInteractionEnabled = false
            contentView.alpha = 0.5
        }
        
        if let url = URL(string: achievement.bg_image_url) {
            self.imageView.af.setImage(withURL: url)
        }
    }
}
