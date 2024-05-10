import UIKit

protocol PassDataToVC: AnyObject {
    func passData(name: String, email: String, profilePicture: Data?)
}

class EditProfileTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var editName: UITextField!
    @IBOutlet weak var editEmailId: UITextField!
    @IBOutlet weak var editProfilePicture: UIImageView!
    
    // MARK: - Properties
    
    var nameData = ""
    var emailData = ""
    var profilePictureData: Data?
    weak var delegate: PassDataToVC?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Actions
    
    @IBAction func imagePickerButtonTapped(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = editName.text, !name.isEmpty else {
            showAlert(message: "Please enter your name.")
            return
        }
        guard let email = editEmailId.text, !email.isEmpty else {
            showAlert(message: "Please enter your email.")
            return
        }
        delegate?.passData(name: name, email: email, profilePicture: profilePictureData)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        editProfilePicture.image = image
        profilePictureData = image.pngData()
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        editName.text = nameData
        editEmailId.text = emailData
        editProfilePicture.image = UIImage(data: profilePictureData ?? Data())
        editProfilePicture.layer.cornerRadius = editProfilePicture.bounds.width / 2
        editProfilePicture.clipsToBounds = true
    }
    
    private func showAlert(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
