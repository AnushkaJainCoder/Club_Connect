//
//  ClubPageInfoViewController.swift
//  Club_Connect
//
//  Created by student on 06-05-2024.
//

import UIKit

class ClubPageInfoViewController: UIViewController, ClubPageRegistrationViewControllerDelegate{
    func updateProperty(newValue: String) {
        updated = newValue
    }
    
    var selectedItem: Club?
    var updated: String?
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var descrription: UILabel!
    @IBOutlet weak var clubImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedItem = selectedItem{
            if let image = UIImage(named: selectedItem.clubImage ?? ""){
                clubImage.image = image
                clubImage.layer.cornerRadius = 10
            }
            else{
                print("image not found")
            }
            descrription.text = selectedItem.description
        }
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if let updated {
            register.setTitle("Registered", for: .normal)
            register.isEnabled = false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationVc = segue.destination as? UINavigationController, let destinationVc = navigationVc.topViewController as? ClubPageRegistrationViewController{
            if let selectedItem = selectedItem{
                destinationVc.delegate = self
                destinationVc.selectedItem = selectedItem
            }
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
