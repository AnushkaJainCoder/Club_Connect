import UIKit

class ClubCategoriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var CategoryImage: UIImageView!
    
    func setup(_ item: ClubCategory){
        CategoryImage.image = UIImage(named: item.image)
        CategoryImage.layer.cornerRadius = 15
        CategoryImage.clipsToBounds = true
    }
    
}
