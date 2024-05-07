//
//  ClubPageRegistrationViewController.swift
//  Club_Connect
//
//  Created by student on 06-05-2024.
//

import UIKit

protocol ClubPageRegistrationViewControllerDelegate{
    func updateProperty(newValue: String)
}


class ClubPageRegistrationViewController: UITableViewController {
    var selectedItem: Club?
    var delegate: ClubPageRegistrationViewControllerDelegate?

    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var clubImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedItem = selectedItem{
            if let image = UIImage(named: selectedItem.clubImage ?? ""){
                clubImage.image = image
                clubImage.layer.cornerRadius = 10
            }
            clubName.text = selectedItem.name
        }

        // Do any additional setup after loading the view.
    }
    

    @IBAction func doneButton(_ sender: Any) {
        
        dismiss(animated: true){
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
               let window = appDelegate.window,
               let rootViewController = window.rootViewController{
            }}
        
        self.showAlert(title: "Registration Succesfull", message: "Your entry for event has been successful registerd")
        
        
    }
    
    func showAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        delegate?.updateProperty(newValue: "Updated")
        if let viewController = UIApplication.shared.windows.first?.rootViewController{
            viewController.present(alertController, animated: true, completion: nil)
            viewController.viewWillAppear(true)
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

}
