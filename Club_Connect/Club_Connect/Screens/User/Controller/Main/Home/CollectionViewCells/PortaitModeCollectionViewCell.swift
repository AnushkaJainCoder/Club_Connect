//
//  PortaitModeCollectionViewCell.swift
//  Club_Connect
//
//  Created by student on 25-04-2024.
//

import UIKit

final class PortaitModeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitlelbl: UILabel!
    
    @IBOutlet weak var datee: UILabel!



    @IBOutlet weak var cname: UILabel!
    
    
    
    func setup(_ item: ListItem) {
        cellImageView.image = UIImage(named: item.image)
        cellTitlelbl.text = item.title
        
        cellTitlelbl.numberOfLines = 0
            cellTitlelbl.lineBreakMode = .byWordWrapping
        cellTitlelbl.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        datee.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        cname.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        
        cellImageView.layer.cornerRadius = 15 // Adjust the corner radius as needed
                cellImageView.clipsToBounds = true
//        cellImageView.contentMode = .scaleAspectFill

        
    }
}
