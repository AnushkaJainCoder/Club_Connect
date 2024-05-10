import UIKit

class ClubInfoViewController: UIViewController, ClubRegistrationViewControllerDelegate {
    
    func updateProperty(newValue: String) {
            updated = newValue
    }
    
    // Property to hold updated registration status
    var updated: String?
    
    // Property to hold the selected item
    var selectedItem: ListItem?
    
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var registerButtonTapped: UIButton!
    @IBOutlet weak var imagee: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let selectedItem = selectedItem {
            if let image = UIImage(named: selectedItem.image ?? "reco") {
                imagee.image = image
                imagee.layer.cornerRadius = 10
            } else {
                print("Image not found")
            }
            desc.text = selectedItem.desc
            print(selectedItem.desc)
        } else {
            print("No data")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Update register button title and enable state if registration status is updated
        if let updated = updated {
            registerButtonTapped.setTitle("Registered", for: .normal)
            registerButtonTapped.isEnabled = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass selected item to registration view controller
        if let navigationVC = segue.destination as? UINavigationController, let destinationVC = navigationVC.topViewController as? ClubRegistrationViewController {
            if let selectedItem = selectedItem {
                destinationVC.delegate = self
                destinationVC.selectedItem = selectedItem
            }
        }
    }
}
