//
//  ClubInfoViewController.swift
//  Club_Connect
//
//  Created by student on 02-05-2024.
//

import UIKit

class ClubInfoViewController: UIViewController {
    var selectedItem: ListItem?
    @IBOutlet weak var imagee: UIImageView!
    
    @IBOutlet weak var eventTitle: UILabel!
    
    @IBOutlet weak var Eventdata: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let selectedItem = selectedItem {
                // Load the image
                if let image = UIImage(named: selectedItem.image) {
                    imagee.image = image
                    imagee.layer.cornerRadius = 10
                    
                } else {
                    print("Image not found")
                }
                
                // Set the event data
            Eventdata.text = selectedItem.desc
           // eventTitle.text = selectedItem.title
            print(selectedItem.desc)
            } else {
                print("No data")
            }
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
