import UIKit

class EventDisplayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var eventViewTable: UITableView!
    
    var eventList = eventDataModel.getUpcommingRventList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventViewTable.dataSource = self
        eventViewTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! EventDisplayTableViewCell
        
        let events = eventList[indexPath.row]
        cell.updateView(details: events)
        
        // Set alternating background colors for better readability
        cell.contentView.backgroundColor = (indexPath.row % 2 == 0) ? .systemGray6 : .systemGray6
        
        return cell
    }
}
