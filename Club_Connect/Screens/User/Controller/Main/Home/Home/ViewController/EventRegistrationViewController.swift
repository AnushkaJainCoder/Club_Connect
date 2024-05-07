//
//  EventRegistrationViewController.swift
//  Club_Connect
//
//  Created by student on 02-05-2024.
//

import UIKit

protocol EventRegistrationViewControllerDelegate {
    func updateProperty(newValue: String)
}

class EventRegistrationTableViewController: UITableViewController {

    var selectedItem: ListItem?
    var delegate: EventRegistrationViewControllerDelegate?
    
    @IBOutlet weak var eventTitle: UILabel!
   
    @IBOutlet weak var imageEvent: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedItem = selectedItem {
            // Load the image
            if let image = UIImage(named: selectedItem.image) {
                imageEvent.image = image
                imageEvent.layer.cornerRadius = 10
                
            } else {
                print("Image not found")
            }
            eventTitle.text = selectedItem.image
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func onClick(_ sender: Any) {
        
              
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
