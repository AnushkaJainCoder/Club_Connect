import UIKit

class EventDisplayTableViewCell: UITableViewCell {

    @IBOutlet weak var eventPoster: UIImageView!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var eventDetails: UILabel!
//    
    func updateView(details : EventListItem ){
        eventPoster.image = UIImage(named: details.eventPosterImage)
        eventName.text = details.eventName
        clubName.text = details.eventHost
        eventDetails.text = details.eventDetails
        
    }
}
