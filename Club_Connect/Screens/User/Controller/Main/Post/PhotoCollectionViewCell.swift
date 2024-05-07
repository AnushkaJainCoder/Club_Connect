////////
////////  PhotoCollectionViewCell.swift
////////  PostClubConnect
////////
////////  Created by student on 22-04-2024.
//////import UIKit

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        // Set isUserInteractionEnabled here
        imageView.isUserInteractionEnabled = true
        
        let images: [String] = [
            "A", "feed6", "381609194_1886947605068299_1054279689888768085_n", "feed11", "feed8", "feed7", "feed9", "WhatsApp Image 2024-04-24 at 11.43.34 PM (2)", "feed11",
//            UIImage(named: "c2s2"),
//            UIImage(named: "image3"),
//            UIImage(named: "image4"),
//            UIImage(named: "image1"),
//            UIImage(named: "image2"),
//            UIImage(named: "image3"),
//            UIImage(named: "image4")
            
        ].compactMap { $0 }
        
        imageView.image = UIImage(named: images.randomElement() ?? "feed1")
    
        ///print("sefsfsdfsdf" + String(imageView.tag))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
        // Custom layout code here
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        imageView.image = nil // Reset the image to clear previous content
    }
}
