//
//  ClubCategoriesCollectionViewCell.swift
//  Club_Connect
//
//  Created by student on 30-04-2024.
//

import UIKit

class ClubCategoriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var CategoryImage: UIImageView!
    
    
    func setup(_ item: ListItem){
        CategoryImage.image = UIImage(named: item.image)
        CategoryImage.layer.cornerRadius = 15
        CategoryImage.clipsToBounds = true
      //  CategoryImage.contentMode = .scaleAspectFill
    }
    
}
