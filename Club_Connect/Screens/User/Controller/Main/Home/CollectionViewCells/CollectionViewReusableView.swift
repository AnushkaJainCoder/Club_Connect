import UIKit

final class CollectionViewReusableView: UICollectionReusableView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var cellTitlelbl: UILabel!
    @IBOutlet weak var isButton: UIButton!
    
    // MARK: - Setup Method
    
    func setup(_ title: String, isButtonHidden: Bool) {
        // Set title label text and attributes
        cellTitlelbl.text = title
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 20),
        ]
        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        cellTitlelbl.attributedText = attributedTitle
        
        // Set button visibility
        isButton.isHidden = isButtonHidden
    }
}
