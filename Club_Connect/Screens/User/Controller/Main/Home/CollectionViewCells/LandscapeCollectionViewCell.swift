import UIKit

final class LandscapeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitlelbl: UILabel!
    
    // MARK: - Setup Method
    
    func setup(_ item: ListItem) {
        // Set image and title
        cellImageView.image = UIImage(named: item.image)
        cellTitlelbl.text = item.title
        
        // Round corners of image view
        cellImageView.layer.cornerRadius = 16
        cellImageView.clipsToBounds = true
    }
}
