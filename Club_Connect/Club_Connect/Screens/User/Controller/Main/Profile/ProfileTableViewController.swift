
import UIKit

class ProfileTableViewController: UITableViewController{

   
    
    var loginEmail: String?
//    print(l÷)
    
    
    override func viewDidLoad() {
        print(loginEmail)
        super.viewDidLoad()
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
    
        return cell
    }

         
    }


 
    

