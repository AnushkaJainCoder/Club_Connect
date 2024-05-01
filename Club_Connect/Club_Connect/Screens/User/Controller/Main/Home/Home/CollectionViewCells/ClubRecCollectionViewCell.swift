//
//  ClubRecCollectionViewCell.swift
//  Club_Connect
//
//  Created by student on 29-04-2024.
//

import UIKit

class ClubRecCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var clubImage: UIImageView!
    
    @IBOutlet weak var exploreButton: UIButton!
    
    func setup(_ item: ListItem) {
        clubImage.image = UIImage(named: item.image)
        exploreButton.titleLabel?.font = UIFont.systemFont(ofSize: 5)
        clubImage.layer.cornerRadius = 15
       // exploreButton.isHidden = true
        exploreButton.frame.size = CGSize(width: 75, height: 30)
//        exploreButton.titleLabel?.font = UIFont.systemFont(ofSize: 2)
        // Adjust the corner radius as needed
        clubImage.clipsToBounds = true
    }
}
