import UIKit

class FeedTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var selectedImage: UIImage?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedImage = selectedImage {
            print("Received data: \(selectedImage)")
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCellIdentifier", for: indexPath) as! FeedCell
        cell.feedImage.image = selectedImage
        return cell
    }
    
}
