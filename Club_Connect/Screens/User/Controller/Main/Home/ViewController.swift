import UIKit

class MyTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegate of the tab bar controller to self
        self.delegate = self
    }
    
    // MARK: - UITabBarControllerDelegate
    
    // Called when a tab is selected
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Reset navigation stack for the selected tab's root view controller
        if let navController = viewController as? UINavigationController {
            navController.popToRootViewController(animated: false)
        }
    }
}
