//////////
//////////  PhotoCollectionViewCell.swift
//////////  PostClubConnect
//////////
//////////  Created by student on 22-04-2024.
////////
//import UIKit
//import Photos
//
//class PhotoCollectionViewCell: UICollectionViewCell {
//    static let identifier = "PhotoCollectionViewCell"
//    
//     let imageView: UIImageView = {
//           let imageView = UIImageView()
//           imageView.contentMode = .scaleAspectFill
//           imageView.clipsToBounds = true
//           isUserInteractionEnabled = true
//           return imageView
//       }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        contentView.addSubview(imageView)
//        
//        let images = [
//            
//            UIImage(named: "image1"),
//            UIImage(named: "image2"),
//            UIImage(named: "image3"),
//            
//            UIImage(named: "image4")
//            
//           
//            
//        ].compactMap ({ $0 })
//
//        imageView.image = images.randomElement()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
//
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        imageView.frame = contentView.bounds
//        // Custom layout code here
//    }
//    
//    override func prepareForReuse() {
//        super.prepareForReuse()
////        imageView.image = nil
//        // Custom prepare for reuse code here
//    }
//}
//
//
//
//
////import UIKit
////import Photos
////
////class PhotoCollectionViewCell: UICollectionViewCell {
////
////    static let identifier = "PhotoCollectionViewCell"
////
////    private let imageView: UIImageView = {
////        let imageView = UIImageView()
////        imageView.contentMode = .scaleAspectFill
////        imageView.clipsToBounds = true
////        return imageView
////    }()
////
////    override init(frame: CGRect) {
////        super.init(frame: frame)
////        contentView.addSubview(imageView)
////        fetchGalleryImage() // Call fetchGalleryImage() in init for immediate loading
////    }
////
////    required init?(coder: NSCoder) {
////        fatalError("init(coder:) has not been implemented")
////    }
////
////    override func layoutSubviews() {
////        super.layoutSubviews()
////        imageView.frame = contentView.bounds
////    }
////
////    override func prepareForReuse() {
////        super.prepareForReuse()
////        imageView.image = nil
////    }
////
////    private func fetchGalleryImage() {
////        if PHPhotoLibrary.authorizationStatus() == .authorized {
////            let fetchOptions = PHFetchOptions()
////            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)] // Sort by creation date (optional)
////
////            // Use PHFetchResult<PHAsset> to fetch all media types
////            let fetchResult = PHAsset.fetchAssets(with: nil, options: fetchOptions) // No media type specified fetches all
////
////            // Get the first asset (or use a loop to get multiple images)
////            if let firstAsset = fetchResult.firstObject {
////                let imageManager = PHImageManager.default()
////                let targetSize = CGSize(width: contentView.frame.width, height: contentView.frame.height) // Adjust as needed
////                let contentMode = PHImageContentMode.aspectFill
////                let options = PHImageRequestOptions()
////                options.isSynchronous = false // Use asynchronous fetching for better performance
////
////                imageManager.requestImage(for: firstAsset, targetSize: targetSize, contentMode: contentMode, options: options) { [weak self] image, data, error in
////                    DispatchQueue.main.async {
////                        guard let self = self else { return }
////                        self.imageView.image = image // Directly set the image on the imageView
////                    }
////                }
////            } else {
////                // Handle no assets available case
////                print("No gallery items found.")
////            }
////        } else {
////            // Handle unauthorized access case
////            print("Photo library access not authorized. Request permission in your ViewController.")
////        }
////    }
////
////}
