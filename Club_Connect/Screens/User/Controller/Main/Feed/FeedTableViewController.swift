//
//  MainTableViewController.swift
//  FeedS
//
//  Created by Vishesh Gupta on 28/04/24.
//

import UIKit

class FeedTableViewController: UITableViewController, PostViewControllerDelegate{
    func updateProperty(newValue: FeedList?) {
        selectedItem = newValue
    }
    
    var selectedItem: FeedList?
    
    var myEvntList: [FeedList] = []
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedItem {
//            myEvntList.u
           // myEvntList.append(selectedItem)
//            myEvntList.insert(selectedItem, at: 0)
            myEvntList = EventsThisWeek().getAllEvents()

//            myEvntList.append(selectedItem ?? FeedList(description: "fntrkgkt", imageName: "feed1"))
//        //    print("helloooooooooooooooooooooooooooooooooooo \(myEvntList.count)")
        } else {
            
            myEvntList = EventsThisWeek().getAllEvents()
            myEvntList = myEvntList.isEmpty ? [] : myEvntList
            myEvntList.insert(selectedItem ?? FeedList(description: "fntrkgkt", imageName: "post_3"), at: 0)
            print("helloooooooooooooooooooooooooooooooooooo \(myEvntList.count)")
           
//           /* myEvntList.append(selectedItem ?? FeedList(description: "fntrkgkt", imageName: "feed1")*/)
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return myEvntList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    // Cell's Content
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedTableViewCell
        // indexPath = [section, row] = [0 1]
        
        cell.update(myEvntList[indexPath.row])
        cell.eventImage.image = selectedImage
        
        cell.showsReorderControl = true
        cell.userImage.layer.cornerRadius = 18
        cell.userImage.contentMode = .scaleToFill
//        cell.userImage.contentMode = .scaleAspectFit
//
//                // Make the image view round
//        cell.userImage.layer.cornerRadius = cell.userImage.frame.width / 2
//        cell.userImage.clipsToBounds = true
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
