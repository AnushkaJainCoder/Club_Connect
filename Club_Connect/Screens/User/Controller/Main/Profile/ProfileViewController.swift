//
//  ProfileViewController.swift
//  Club_Connect
//
//  Created by student on 12-04-2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
        
        var user: UserModel?
        
        override func viewDidLoad() {
            super.viewDidLoad()
//            nameLabel.text = 
            if let user {
                nameLabel.text = user.name
                emailLabel.text = user.email
            }
            
//            if let name = nameLabel{
//                print("\(name)")
//            }
//            if let email = emailLabel{
//                print("\(email)")
//            }
            
        }

    
    
    


}
