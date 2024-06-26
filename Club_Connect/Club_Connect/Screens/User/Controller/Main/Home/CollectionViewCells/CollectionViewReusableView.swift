//
//  CollectionViewReusableView.swift
//  Club_Connect
//
//  Created by student on 25-04-2024.
//

import UIKit

final class CollectionViewReusableView: UICollectionReusableView {
    @IBOutlet weak var cellTitlelbl: UILabel!
    
    @IBOutlet weak var isButton: UIButton!
    
    func setup(_ title: String, isButtonHidden: Bool) {
        cellTitlelbl.text = title
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 20),  // Adjust font size and style
        ]
        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        cellTitlelbl.attributedText = attributedTitle
//        isButton.
//        isButton.titleLabel?.text = "Explore"
        
        isButton.isHidden = isButtonHidden
    }
}
