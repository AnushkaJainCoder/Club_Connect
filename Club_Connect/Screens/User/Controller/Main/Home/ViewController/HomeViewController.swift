import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var scannerButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Array to hold image data
    var imgArray = MockData.shared.fetchImageRec()
    var timer: Timer?
    private let sections = MockData.shared.pageData
    var currentIndex = 0
    var index = 0
   
    private let searchViewController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup search controller in navigation bar
        navigationItem.searchController = searchViewController
        navigationItem.hidesSearchBarWhenScrolling = true
        
        // Start timer for automatic scrolling
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(scrollinsetUp), userInfo: nil, repeats: true)
        
        // Set up collection view layout
        collectionView.collectionViewLayout = createLayout()
    }
    
    // Prepare for segue to detail view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailsSegue",
           let destinationVC = segue.destination as? EventInfoViewController,
           let cell = sender as? UICollectionViewCell,
           let indexPath = collectionView.indexPath(for: cell) {
            switch sections[indexPath.section] {
            case .recommended(let items):
                let selectedItem = items[indexPath.item]
                destinationVC.selectedItem = selectedItem
            case .eventsThisWeek(let items):
                let selectedItem = items[indexPath.item]
                destinationVC.selectedItem = selectedItem
            default:
                break
            }
        }
        if segue.identifier == "ShowDetailsSeguesa",
           let destinationVC = segue.destination as? ClubInfoViewController,
           let cell = sender as? UICollectionViewCell,
           let indexPath = collectionView.indexPath(for: cell) {
            if case .recClubs(let items) = sections[indexPath.section] {
                let selectedItem = items[indexPath.item]
                destinationVC.selectedItem = selectedItem
            }
        }
    }
    
    // Timer selector for scrolling images
    @objc func scrollinsetUp(){
        if index < imgArray.count-1 {
            index = index + 1
        } else {
            index = 0
        }
        collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .right, animated: true)
    }
    
    // Start automatic scrolling
    private func startAutomaticScroll() {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(scrollToNextItem), userInfo: nil, repeats: true)
    }

    // Stop automatic scrolling
    private func stopAutomaticScroll() {
        timer?.invalidate()
        timer = nil
    }
    
    // Scroll to next item in collection view
    @objc private func scrollToNextItem() {
        guard case .recommended(let currentSection) = sections.first else { return }
        
        let itemCount = currentSection.count
        currentIndex = (currentIndex + 1) % itemCount
        let indexPath = IndexPath(item: currentIndex, section: 0)
        
        let offsetX = CGFloat(currentIndex) * collectionView.bounds.width
        
        UIView.animate(withDuration: 2.9, delay: 0.1, options: .curveLinear, animations: {
            self.collectionView.contentOffset.x = offsetX
        }, completion: nil)
    }
    
    // Create collection view layout
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self else { return nil }
            let section = self.sections[sectionIndex]
            switch section {
            case .recommended:
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.3)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 15
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
            case .eventsThisWeek:
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 20
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
            case .recClubs:
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.18)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
            }
        }
        layout.configuration.interSectionSpacing = 200
        return layout
    }

    // Create supplementary header item
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let supplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        supplementaryItem.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)
        return supplementaryItem
    }
    
    // Get current date formatted string
    func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM"
        return formatter.string(from: Date())
    }
}

// Extension for UICollectionViewDelegate and UICollectionViewDataSource methods
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch sections[section] {
        case .recommended(let items):
            return items.count
        case .eventsThisWeek(let items):
            return items.count
        case .recClubs(let items):
            return items.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .eventsThisWeek(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PortaitModeCollectionViewCell", for: indexPath) as! PortaitModeCollectionViewCell
            cell.setup(items[indexPath.row])
            return cell
            
        case .recommended(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LandscapeCollectionViewCell", for: indexPath) as! LandscapeCollectionViewCell
            cell.setup(items[indexPath.row])
            return cell

        case .recClubs(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClubRecCollectionViewCell", for: indexPath) as! ClubRecCollectionViewCell
            cell.setup(items[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionViewReusableView", for: indexPath) as? CollectionViewReusableView else {
            fatalError("Unexpected supplementary view kind: \(kind)")
        }
        
        var isButtonHiden: Bool
        
        switch sections[indexPath.section] {
        case .recommended:
            isButtonHiden = true
        case .eventsThisWeek:
            isButtonHiden = false
        case .recClubs:
            isButtonHiden = true
        }

        header.setup(sections[indexPath.section].title, isButtonHidden: isButtonHiden)
        return header
    }
}

class EventThisWeekCell: UICollectionViewCell {
    @IBOutlet weak var EventImage: UIImageView!
    @IBOutlet weak var EventDate: UILabel!
    @IBOutlet weak var EventName: UILabel!
    @IBOutlet weak var ClubName: UILabel!
}
