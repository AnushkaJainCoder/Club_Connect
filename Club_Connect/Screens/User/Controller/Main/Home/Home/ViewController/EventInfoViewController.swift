//
//  EventInfoViewController.swift
//  Club_Connect
//
//  Created by student on 02-05-2024.
//

import UIKit

class EventInfoViewController: UIViewController, EventRegistrationViewControllerDelegate {
        func updateProperty(newValue: String) {
            updated = newValue
        }

    @IBOutlet weak var registerButtonTapped: UIButton!
    var updated: String?
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
            eventTitle.text = selectedItem.title
            print(selectedItem.desc)
            } else {
                print("No data")
            }
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let updated {
            registerButtonTapped.setTitle("Registered", for: .normal)
            registerButtonTapped.isEnabled = false
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationVC = segue.destination as? UINavigationController, let destinationVC = navigationVC.topViewController as? EventRegistrationTableViewController {
            
            if let selectedItem = selectedItem {
                destinationVC.delegate = self
                destinationVC.selectedItem = selectedItem
            }
            
            
        }
    }
    
    @IBAction func unwindToEventInfo(unwindSegue: UIStoryboardSegue) {
        
    }
    
}
