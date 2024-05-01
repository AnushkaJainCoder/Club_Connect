//
//  FeedTableViewCell.swift
//  Club_Connect
//
//  Created by student on 01-05-2024.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet var userImage: UIImageView!
    
    @IBOutlet var userName: UILabel!
    
    @IBOutlet var organisation: UILabel!
    
    @IBOutlet var eventImage: UIImageView!
    
    
    @IBOutlet var likeCount: UILabel!
    
    @IBOutlet var caption: UILabel!
    
    @IBOutlet var comments: UILabel!
    
    @IBOutlet var time: UILabel!
    
    func update(_ event: FeedListi) {
//        eventImage.image = UIImage(named: "post_3")
//        eventLabel.text = event.title
        
        userImage.image = UIImage(named: "head")
        userName.text = "Sanya Gupta"
        organisation.text = "Apple Student Community"
        eventImage.image = UIImage(named: "post_3")
        
        likeCount.text = "180 Likes"
        caption.text = "What a great experince, thank you ASC "
        comments.text = "View all 36 comments"
        time.text = "2 Hours"
        
        
        
//        userImage.image = UIImage(named: "head")
//        userName.text = "Sanya Gupta"
//        organisation.text = "Apple Student Community"
//        eventImage.image = UIImage(named: "post_1")
//
//        likeCount.text = "180 Likes"
//        caption.text = "What a great experince"
//        comments.text = "View all 36 comments"
//        time.text = "2 Hours"
//        userImage.image = UIImage(named: "head")
//        userName.text = "Rohit Gupta"
//        organisation.text = "Apple std Com"
//        eventImage.image = UIImage(named: "post_2")
//
//        likeCount.text = "5"
//        caption.text = "This is the sample caption text."
//        comments.text = "View all coments"
//        time.text = "120"
    }

}
