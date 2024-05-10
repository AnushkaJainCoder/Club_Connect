import UIKit

// Protocol for communication between EventRegistrationViewController and its delegate
protocol EventRegistrationViewControllerDelegate {
    func updateProperty(newValue: String)
}

class EventRegistrationTableViewController: UITableViewController {
 
    var selectedItem: ListItem?
    var delegate: EventRegistrationViewControllerDelegate?
    
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var imageEvent: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        if let selectedItem = selectedItem {
            // Load the image
            if let image = UIImage(named: selectedItem.image) {
                imageEvent.image = image
                imageEvent.layer.cornerRadius = 10
            } else {
                print("Image not found")
            }
            eventTitle.text = selectedItem.image
        }
    }
    
    @IBAction func onClick(_ sender: Any) {
        dismiss(animated: true) {
            // Dismiss the view controller
        }
        showAlert(title: "Registration Successful", message: "Your entry for the event has been successfully registered.")
    }
    
    // Helper Methods
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        // Notify delegate about the update
        delegate?.updateProperty(newValue: "Updated")
        
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            viewController.present(alertController, animated: true, completion: nil)
            viewController.viewWillAppear(true)
        }
    }
}
