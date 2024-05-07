//
//  ClubRegistrationViewController.swift
//  Club_Connect
//
//  Created by student on 05-05-2024.
//

import UIKit

protocol ClubRegistrationViewControllerDelegate {
    func updateProperty(newValue: String)
}

class ClubRegistrationViewController: UITableViewController {
    
    var selectedItem: ListItem?
    var delegate: ClubRegistrationViewControllerDelegate?
    
    @IBOutlet weak var ClubTitle: UILabel!
   
    @IBOutlet weak var imageClub: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedItem = selectedItem {
            // Load the image
            if let image = UIImage(named: selectedItem.image ?? "") {
                imageClub.image = image
                imageClub.layer.cornerRadius = 10
                
            } else {
                print("Image not found")
            }
            ClubTitle.text = selectedItem.title
            print(selectedItem.title)
        }
    }
    

    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true) {
      
      if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
         let window = appDelegate.window,
         let rootViewController = window.rootViewController {
         
          
      }
  }
  
  self.showAlert(title: "Registration Succesfull", message: "Your entry for event has been successful registerd")
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        delegate?.updateProperty(newValue: "Updated")
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            //viewController.
            
            viewController.present(alertController, animated: true, completion: nil)
            viewController.viewWillAppear(true)
       }
    }
    
}
