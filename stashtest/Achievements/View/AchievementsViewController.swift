//
//  ViewController.swift
//  stashtest
//
//  Created by David Baez on 11/9/20.
//

import UIKit

extension AchievementsViewController: StoryboardIdentifiable {
    static var storyboard: UIStoryboard.Storyboard {
        return UIStoryboard.Storyboard.achievements
    }
    
    static var storyboardIdentifier: String {
        return "AchievementsViewController"
    }
}

protocol AchievementsViewInterface: class {
    func showAchievementsData(achievementPage: AchievementPage)
    func showNoContentScreen()
}

class AchievementsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: AchievementsModuleInterface!
    
    var achievements: [Achievement] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.presenter.updateView()
    }
}

extension AchievementsViewController: AchievementsViewInterface {
    func showAchievementsData(achievementPage: AchievementPage) {
        self.title = achievementPage.overview.title
        self.achievements = achievementPage.achievements
        self.collectionView.reloadData()
    }
    
    func showNoContentScreen() {
        self.achievements = []
        self.collectionView.reloadData()
        print("NO CONTENT")
    }
}

extension AchievementsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return achievements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AchievementCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        
        let achievement = achievements[indexPath.row]
        cell.setup(achievement: achievement)
        
        return cell
    }
}

extension AchievementsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let achievement = achievements[indexPath.row]
        self.presenter.showDetailsForAchievement(achievement: achievement)
    }
}

extension AchievementsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = min(view.frame.size.width, view.frame.size.height)
        let aspectRatio: (w: CGFloat, h: CGFloat) = (w: 324.0, h: 206.0)
        
        var cellWidth = width
        
        if let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            cellWidth -= collectionViewLayout.sectionInset.left
            cellWidth -= collectionViewLayout.sectionInset.right
        } else {
            cellWidth -= 50.0
        }
        
        let height = aspectRatio.h * (cellWidth / aspectRatio.w)
        return CGSize(width: cellWidth, height: height)
    }
}
