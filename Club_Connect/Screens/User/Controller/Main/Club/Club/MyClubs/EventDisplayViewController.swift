//
//  EventDisplayViewController.swift
//  segmentedControllers
//
//  Created by Vishesh Gupta on 03/05/24.
//

import UIKit

class EventDisplayViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

//    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet var eventViewTable: UITableView!
    
    var eventList = eventDataModel.getUpcommingRventList()

    override func viewDidLoad() { 
        eventViewTable.dataSource = self
        eventViewTable.delegate = self
        super.viewDidLoad()
       
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! EventDisplayTableViewCell
            let events = eventList[indexPath.row]
            cell.updateView(details: events)
        if indexPath.row % 2 == 0 {
               cell.contentView.backgroundColor = .systemGray6 // Example color
           }
        else {
            cell.contentView.backgroundColor = .systemGray6 // Example color
           }
            return cell
    }
    

//    @IBAction func likeButtonClick(_ sender: Any) {
//        if likeButton.isSelected{
//            likeButton.tintColor = .red
//            likeButton.isSelected = false
//        }
//        else{
//            likeButton.tintColor = .white
//            likeButton.isSelected = true
//        }
//    }
}
