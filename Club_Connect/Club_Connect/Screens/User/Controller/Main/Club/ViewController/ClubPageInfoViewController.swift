import UIKit

class ClubPageInfoViewController: UIViewController, ClubPageRegistrationViewControllerDelegate {
    
    // MARK: - Properties
    
    var selectedItem: Club?
    var updated: String?
    
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var clubImageView: UIImageView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedItem = selectedItem {
            if let image = UIImage(named: selectedItem.clubImage ?? "") {
                clubImageView.image = image
                clubImageView.layer.cornerRadius = 10
            } else {
                print("Image not found")
            }
            descriptionLabel.text = selectedItem.description
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let _ = updated {
            register.setTitle("Registered", for: .normal)
            register.isEnabled = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationVC = segue.destination as? UINavigationController,
           let destinationVC = navigationVC.topViewController as? ClubPageRegistrationViewController {
            if let selectedItem = selectedItem {
                destinationVC.delegate = self
                destinationVC.selectedItem = selectedItem
            }
        }
    }

    // MARK: - ClubPageRegistrationViewControllerDelegate
    
    func updateProperty(newValue: String) {
        updated = newValue
    }
}
