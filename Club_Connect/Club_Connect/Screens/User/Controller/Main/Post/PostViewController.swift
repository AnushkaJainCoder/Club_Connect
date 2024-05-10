import UIKit

class PostViewController: UIViewController {
    
    // MARK: - Properties
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.identifier)
        return collectionView
    }()
    
    private let firstSectionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        configureFirstSectionImageView()
    }
    
    // MARK: - Setup
    
    private func setupViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        view.addSubview(firstSectionImageView)
    }
    
    private func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        firstSectionImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstSectionImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            firstSectionImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            firstSectionImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            firstSectionImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            collectionView.topAnchor.constraint(equalTo: firstSectionImageView.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    // MARK: - Configuration
    
    private func configureFirstSectionImageView() {
        guard let exampleImage = UIImage(systemName: "photo.on.rectangle") else {
            print("Example image not found.")
            return
        }
        let coolerGrayImage = exampleImage.withRenderingMode(.alwaysTemplate)
        firstSectionImageView.tintColor = UIColor.systemGray
        firstSectionImageView.image = coolerGrayImage
    }
}

// MARK: - UICollectionViewDataSource

extension PostViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 0 : 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        // Configure cell with photo for the collection view
        // You can use indexPath.row to determine the photo for this cell
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension PostViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if let selectedCell = collectionView.cellForItem(at: indexPath) as? PhotoCollectionViewCell {
                firstSectionImageView.image = selectedCell.imageView.image
                if let secondViewController = storyboard?.instantiateViewController(withIdentifier: "PostTableViewController") as? PostTableViewController {
                    secondViewController.selectedImage = selectedCell.imageView.image
                    navigationController?.pushViewController(secondViewController, animated: true)
                }
            }
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PostViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 5
        let collectionViewWidth = collectionView.frame.size.width
        let itemWidth = (collectionViewWidth - padding * 5) / 4
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

// MARK: - SectionHeaderView

class SectionHeaderView: UICollectionReusableView {
    static let identifier = "SectionHeaderView"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
