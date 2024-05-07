////
////  SignUpViewController.swift
////  Club_Connect
////
////  Created by student on 14-04-2024.
////
//
//import UIKit
//import CoreData
//
//class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//    var user: UserModel?
//    
//    
//    @IBOutlet weak var imagePicker: UIButton!
//    
//    @IBOutlet weak var nameTextField: UITextField!
//    
//    @IBOutlet weak var emailTextField: UITextField!
//    
//    @IBOutlet weak var ProfileImage: UIImageView!
//    
//    
//    private let manager = DatabaseManager()
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        
//    }
//    
//
//    @IBAction func pickAnyImage(_ sender: Any) {
//        let picker = UIImagePickerController()
//      print("hello")
//        picker.delegate = self
//        let alertController = UIAlertController(title: "Select Image", message: nil, preferredStyle: .actionSheet)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
//        
//        if UIImagePickerController.isSourceTypeAvailable(.camera){
//            let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
//                picker.sourceType = .camera
//                self.present(picker, animated: true, completion: nil)
//                
//            }
//            alertController.addAction(cameraAction)
//        }
//        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
//            let galleryAction = UIAlertAction(title: "Gallery", style: .default) { _ in
//                picker.sourceType = .photoLibrary
//                self.present(picker, animated: true, completion: nil)
//                
//            }
//            alertController.addAction(galleryAction)
//        }
//        alertController.addAction(cancelAction)
//        present(alertController, animated: true, completion: nil)
//        
//        
//        
////        picker.allowsEditing = false
////        picker.sourceType = .photoLibrary
////        present(picker,animated: true, completion: nil)
//        
//        
//        
//    }
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            if let pickedImage = info[.originalImage] as? UIImage {
//                ProfileImage.image = pickedImage
//                applyCircularMask()
////                ProfileImage.layer.cornerRadius = ProfileImage.frame.width / 2
////                ProfileImage.clipsToBounds = true
////                ProfileImage.layer.cornerRadius =
////                ProfileImage.frame.height / 2
////                           ProfileImage.clipsToBounds = true
//                
////
//            }
//            picker.dismiss(animated: true, completion: nil)
//        }
//    
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        picker.dismiss(animated: true, completion: nil)
//        
//    } 
//    func applyCircularMask() {
//        let maskLayer = CAShapeLayer()
//        let radius = min(ProfileImage.bounds.width, ProfileImage.bounds.height) / 2
//        let circularPath = UIBezierPath(arcCenter: CGPoint(x: ProfileImage.bounds.midX, y: ProfileImage.bounds.midY), radius: radius, startAngle: 0, endAngle: .pi * 2, clockwise: true)
//        maskLayer.path = circularPath.cgPath
//        ProfileImage.layer.mask = maskLayer
//        ProfileImage.layer.masksToBounds = true
//    }
//    
//    
//    
//    
//    @IBAction func signUp(_ sender: UIButton) {
//        
//        
//        guard let name = nameTextField.text,
//        let email = emailTextField.text,
//
//        !name.isEmpty, !email.isEmpty else{
//                
//                return
//        }
//        
//        user = UserModel(name: "Anushka", email: "anu@gmail.com")
//        if let user {
//            manager.addser(user)
//        }
//     
//        
//        
//        
//    }
//    
//    
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        //if segue.identifier == "ShowProfile"{
//        guard let name = nameTextField.text,
//        let email = emailTextField.text,
//
//        !name.isEmpty, !email.isEmpty else{
//                return
//        }
//        
//        user = UserModel(name: name, email: email)
//        if let user {
//            manager.addser(user)
//        }
//            if let destv = segue.destination as? ProfileViewController {
//                destv.user = user
//                
//          //  }
//        }
//            
//    }
//    }
//    
//    
//    
//
