import UIKit

class NotificationsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
    

}
