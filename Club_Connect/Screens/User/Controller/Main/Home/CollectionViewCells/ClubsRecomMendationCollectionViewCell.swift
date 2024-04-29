//
//  ClubsRecommendationCollectionViewCell.swift
//  Club_Connect
//
//  Created by student on 29-04-2024.
//

import Foundation


import UIKit

class ClubsRecomMendationCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var clubImage: UIImageView!
    
    @IBOutlet weak var exploreButton: UIButton!
    
    func setup(_ item: ListItem) {
        clubImage.image = UIImage(named: item.image)
       // cellTitlelbl.text = item.title
        
        clubImage.layer.cornerRadius = 10
        // Adjust the corner radius as needed
                clubImage.clipsToBounds = true
        
        
//        cellImageView.contentMode = .scaleAspectFill

    }
    
}
