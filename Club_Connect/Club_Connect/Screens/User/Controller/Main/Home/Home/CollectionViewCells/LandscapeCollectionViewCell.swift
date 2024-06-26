//
//  LandscapeCollectionViewCell.swift
//  Club_Connect
//
//  Created by student on 25-04-2024.
//
import UIKit

final class LandscapeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitlelbl: UILabel!
    
    
    
    
    
    
    func setup(_ item: ListItem) {
        cellImageView.image = UIImage(named: item.image)
        cellTitlelbl.text = item.title
        
        cellImageView.layer.cornerRadius = 16
        // Adjust the corner radius as needed
                cellImageView.clipsToBounds = true
        
        
//        cellImageView.contentMode = .scaleAspectFill

    }
}
