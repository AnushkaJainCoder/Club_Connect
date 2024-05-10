import UIKit

class PostTableViewController: UITableViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var clubpost: UITextField!
    
    // MARK: - Properties
    
    var selectedImage: UIImage?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let selectedImage = selectedImage {
            eventImage.image = selectedImage
        }
        performSegue(withIdentifier: "FeedSegue", sender: nil)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FeedSegue" {
            if let destinationVC = segue.destination as? FeedTableViewController {
                // Pass the data to the destination view controller
                destinationVC.selectedImage = eventImage.image
                print("no\(selectedImage)")
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction func submitButton(_ sender: Any) {
        // Handle submit button action
    }
}
