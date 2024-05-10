import UIKit

protocol ClubPageRegistrationViewControllerDelegate {
    func updateProperty(newValue: String)
}

class ClubPageRegistrationViewController: UITableViewController {
    
    // MARK: - Properties
    
    var selectedItem: Club?
    var delegate: ClubPageRegistrationViewControllerDelegate?

    @IBOutlet weak var clubNameLabel: UILabel!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var clubImageView: UIImageView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedItem = selectedItem {
            if let image = UIImage(named: selectedItem.clubImage ?? "") {
                clubImageView.image = image
                clubImageView.layer.cornerRadius = 10
            }
            clubNameLabel.text = selectedItem.name
        }
    }

    // MARK: - Actions
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        dismiss(animated: true) {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
               let window = appDelegate.window,
               let rootViewController = window.rootViewController {
            }
        }
        
        showAlert(title: "Registration Successful", message: "Your entry for the event has been successfully registered.")
    }
    
    // MARK: - Helper Methods
    
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
