import UIKit

class CategoryWiseClubsCollectionViewCell: UICollectionViewCell {
    var item: Club?
    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var clubImage: UIImageView!
    @IBOutlet weak var joinButton: UIButton!
    
    // Configure cell UI with the provided Club object
    func setUp(_ item: Club) {
        self.item = item
        clubName.text = item.name // Display club name
        clubImage.image = UIImage(named: item.clubLogo ?? "repo") // Display club image
        clubImage.layer.cornerRadius = 20
        self.layer.cornerRadius = 15
        
        // Configure join button based on club status
        if item.joined == true {
            joinButton.setTitle("Joined", for: .normal)
            joinButton.setTitleColor(.systemGray4, for: .normal)
        } else if item.processing == true {
            joinButton.setTitle("Processing", for: .normal)
            joinButton.setTitleColor(.systemGray4, for: .normal)
        } else {
            joinButton.setTitle("Join", for: .normal)
            joinButton.setTitleColor(.blue, for: .normal)
        }
    }
    
    // Handle join button click event
    @IBAction func onClick(_ sender: Any) {
        if let item = self.item {
            if item.joined == false && item.processing == false {
                // Show alert indicating request sent
                let alertController = UIAlertController(title: "Request Sent", message: "Your request to join the club has been sent successfully.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                if let viewController = self.window?.rootViewController {
                    viewController.present(alertController, animated: true, completion: nil)
                }
                
                // Update button title and color to indicate processing
                joinButton.setTitle("Processing", for: .normal)
                club.updateChanges(item: item.name)
                joinButton.setTitleColor(.systemGray4, for: .normal)
            }
        }
    }
}
