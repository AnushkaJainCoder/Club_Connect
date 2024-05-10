import UIKit

final class PortaitModeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitlelbl: UILabel!
    @IBOutlet weak var datee: UILabel!
    @IBOutlet weak var cname: UILabel!
    
    // MARK: - Setup Method
    
    func setup(_ item: ListItem) {
        // Configure image view
        cellImageView.image = UIImage(named: item.image)
        cellImageView.layer.cornerRadius = 15
        cellImageView.clipsToBounds = true
        
        // Configure title label
        cellTitlelbl.text = item.title
        cellTitlelbl.numberOfLines = 0
        cellTitlelbl.lineBreakMode = .byWordWrapping
        cellTitlelbl.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        // Configure date label
        datee.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        // Configure club name label
        cname.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    }
}
