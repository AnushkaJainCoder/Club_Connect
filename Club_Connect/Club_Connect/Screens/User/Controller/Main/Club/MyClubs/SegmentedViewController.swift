import UIKit

class SegmentedViewController: UIViewController {

    @IBOutlet weak var Events: UIView!
    @IBOutlet weak var Posts: UIView!
    @IBOutlet weak var About: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func showComponent(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            Events.alpha = 1
            Posts.alpha = 0
            About.alpha = 0
        } else if (sender.selectedSegmentIndex == 1){
            Events.alpha = 0
            Posts.alpha = 1
            About.alpha = 0
        }else if (sender.selectedSegmentIndex == 2){
            Events.alpha = 0
            Posts.alpha = 0
            About.alpha = 1
        }
        
    }

}

