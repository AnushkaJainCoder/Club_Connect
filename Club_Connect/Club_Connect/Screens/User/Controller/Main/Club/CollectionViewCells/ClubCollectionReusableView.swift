import UIKit

class ClubCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var cellTitlelbl: UILabel!
    
    func setup(_ title: String) {
        cellTitlelbl.text = title
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 20),  // Adjust font size and style
        ]
        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        cellTitlelbl.attributedText = attributedTitle
    }
}
