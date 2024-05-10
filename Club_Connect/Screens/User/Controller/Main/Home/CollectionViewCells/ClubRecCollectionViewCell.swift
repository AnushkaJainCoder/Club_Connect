import UIKit

class ClubRecCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var clubImage: UIImageView!
    
    // MARK: - Setup Method
    
    func setup(_ item: ListItem) {
        // Set club image
        clubImage.image = UIImage(named: item.image ?? "")
        clubImage.layer.cornerRadius = 15
        clubImage.clipsToBounds = true
    }
}
