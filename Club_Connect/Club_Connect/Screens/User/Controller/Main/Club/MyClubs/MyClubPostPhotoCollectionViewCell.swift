import UIKit
import Photos

class MyClubPostPhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        // Array of image names
        let images = [
            UIImage(named: "Screenshot 2024-05-06 at 4.41.55 AM"),
            UIImage(named: "Screenshot 2024-05-06 at 4.41.18 AM"),
            UIImage(named: "Screenshot 2024-05-06 at 4.40.46 AM"),
            UIImage(named: "ABS"),
            UIImage(named: "ASD"),
            UIImage(named: "AWE"),
            UIImage(named: "QWE"),
            UIImage(named: "POI"),
            UIImage(named: "Screenshot 2024-05-06 at 4.38.49 AM"),
            UIImage(named: "IO"),
            UIImage(named: "QR"),
            UIImage(named: "Screenshot 2024-05-06 at 4.40.23 AM"),
            UIImage(named: "Screenshot 2024-05-06 at 4.40.30 AM"),
            UIImage(named: "Screenshot 2024-05-06 at 4.40.38 AM"),
            UIImage(named: "Screenshot 2024-05-06 at 4.40.38 AM"),
            UIImage(named: "Screenshot 2024-05-06 at 4.40.14 AM")
        ].compactMap ({ $0 })

        imageView.image = images.randomElement() // Set a random image from the array
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    // Set the frame of the image view to match the cell's bounds
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
        // Custom layout code here
    }
    
    // Reset the image view's image when the cell is reused
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
