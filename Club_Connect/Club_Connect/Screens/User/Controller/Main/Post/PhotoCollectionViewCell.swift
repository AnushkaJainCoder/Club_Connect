import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true // Set isUserInteractionEnabled here
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        let images: [String] = [
            "A", "feed6", "381609194_1886947605068299_1054279689888768085_n", "feed11", "feed8", "feed7", "feed9", "WhatsApp Image 2024-04-24 at 11.43.34 PM (2)", "feed11"
        ].compactMap { $0 }
        
        imageView.image = UIImage(named: images.randomElement() ?? "feed1")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
       
    }
}
