//
//  ClubInfoViewController.swift
//  Club_Connect
//
//  Created by student on 02-05-2024.
//

import UIKit

class ClubInfoViewController: UIViewController, ClubRegistrationViewControllerDelegate {
    func updateProperty(newValue: String) {
        updated = newValue
    }
    @IBOutlet weak var desc: UILabel!
    
    @IBOutlet weak var registerButtonTapped: UIButton!
    var updated: String?
    
    var selectedItem: ListItem?
    @IBOutlet weak var imagee: UIImageView!
    
//    @IBOutlet weak var eventTitle: UILabel!
    
//    @IBOutlet weak var Clubdata: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedItem = selectedItem {
                // Load the image
            if let image = UIImage(named: selectedItem.image ?? "reco") {
                    imagee.image = image
                    imagee.layer.cornerRadius = 10
                    
                } else {
                    print("Image not found")
                }
            desc.text = selectedItem.desc
//            selectedItem.desc =
                
                // Set the event data
//            Clubdata.text = selectedItem.description
           // eventTitle.text = selectedItem.title
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
        if let navigationVC = segue.destination as? UINavigationController, let destinationVC = navigationVC.topViewController as? ClubRegistrationViewController {
            if let selectedItem = selectedItem {
                destinationVC.delegate = self
                destinationVC.selectedItem = selectedItem
                print(selectedItem.image)
            }
            
            
        }
    }
    
    @IBAction func unwindToClubInfo(unwind: UIStoryboardSegue) {
        
    }
    
    
    
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let navigationVC = segue.destination as? UINavigationController, let destinationVC = navigationVC.topViewController as? ClubRegistrationViewController {
//            if let selectedItem = selectedItem {
//                destinationVC.selectedItem = selectedItem
//            }
//            
//            
//        }
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let navigationVC = segue.destination as? UINavigationController, let destinationVC = navigationVC.topViewController as? EventRegistrationTableViewController {
//            if let selectedItem = selectedItem {
//                destinationVC.selectedItem = selectedItem
//            }
//            
//            
//        }
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let navigationVC = segue.destination as? UINavigationController, let destinationVC = navigationVC.topViewController as? EventRegistrationTableViewController {
//            if let selectedItem = selectedItem {
//                destinationVC.selectedItem = selectedItem
//                print(selectedItem)
//            }
//            
//            
//        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


