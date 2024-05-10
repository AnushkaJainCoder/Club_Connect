import UIKit

// Protocol for communication between ClubRegistrationViewController and its delegate
protocol ClubRegistrationViewControllerDelegate {
    func updateProperty(newValue: String)
}

class ClubRegistrationViewController: UITableViewController {
    
    var selectedItem: ListItem?
    var delegate: ClubRegistrationViewControllerDelegate?
    
    @IBOutlet weak var ClubTitle: UILabel!
    @IBOutlet weak var imageClub: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        if let selectedItem = selectedItem {
            if let image = UIImage(named: selectedItem.image ?? "") {
                imageClub.image = image
                imageClub.layer.cornerRadius = 10
            } else {
                print("Image not found")
            }
            ClubTitle.text = selectedItem.title
            print(selectedItem.title)
        }
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true) {
            
        }
        showAlert(title: "Registration Successful", message: "Your entry for the event has been successfully registered.")
    }
    
    // ShowAlert Method
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        delegate?.updateProperty(newValue: "Updated")
        
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            viewController.present(alertController, animated: true, completion: nil)
            viewController.viewWillAppear(true)
        }
    }
}
