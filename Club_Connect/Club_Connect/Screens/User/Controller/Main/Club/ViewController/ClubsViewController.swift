import UIKit

class ClubsViewController: UIViewController {
    
    @IBOutlet weak var clubCollectionView: UICollectionView!
    var selectedItem: String?
    private var sections = SampleData.shared.pageData
    
    private let searchViewController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchViewController
        navigationItem.hidesSearchBarWhenScrolling = true
        
        clubCollectionView.collectionViewLayout = createLayout()
    }
    
    func categoryButtonTapped(category: String) {
        selectedItem = category
        updateDataSource()
    }
    
    func updateDataSource() {
        if let selectedItem = selectedItem {
            let filteredClubs = club.categoryWiseClubs(category: selectedItem)
            if selectedItem != "All" {
                if sections.count == 3 {
                    sections.removeLast()
                }
                sections.removeLast()
                sections.append(.categoryWiseFilter(filteredClubs))
            } else {
                sections = SampleData.shared.pageData
            }
        }
        
        clubCollectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailsSeguesa" {
            if let destinationVC = segue.destination as? ClubPageInfoViewController {
                if let cell = sender as? UICollectionViewCell,
                   let indexPath = clubCollectionView.indexPath(for: cell) {
                    switch sections[indexPath.section] {
                    case .recClubs(let items):
                        let selectedItem = items[indexPath.item]
                        destinationVC.selectedItem = selectedItem
                    default:
                        break
                    }
                }
            }
        }
    }
    
    // create layout
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self else { return nil }
            
            let section = self.sections[sectionIndex]
            switch section {
            case .categories:
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalHeight(0.15)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 10)
                section.boundarySupplementaryItems = [supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
            case .myClubs:
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.9)))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.10)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                // section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 10)
                section.boundarySupplementaryItems = [supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
            case .recClubs(_):
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.6)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 10)
                section.boundarySupplementaryItems = [supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
            case .categoryWiseFilter(_):
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.9)))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.1)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                // section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 10)
                section.boundarySupplementaryItems = [supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
            }
        }
        layout.configuration.interSectionSpacing = 20
        return layout
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    
}
extension ClubsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .categories(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClubCategoriesCollectionViewCell", for: indexPath) as! ClubCategoriesCollectionViewCell
            cell.setup(items[indexPath.row])
            return cell
        case .myClubs(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyClubCollectionViewCell", for: indexPath) as! MyClubCollectionViewCell
            cell.setUp(items[indexPath.row])
            return cell
        case .recClubs(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecClubsCollectionViewCell", for: indexPath) as! RecClubsCollectionViewCell
            cell.setUp(items[indexPath.row])
            return cell
        case .categoryWiseFilter(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryWiseClubsCollectionViewCell", for: indexPath) as! CategoryWiseClubsCollectionViewCell
            cell.setUp(items[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ClubCollectionReusableView", for: indexPath) as! ClubCollectionReusableView
            header.setup(sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            switch sections[indexPath.section] {
            case .categories(let items):
                let selectedCategory = items[indexPath.row].categoryName
                categoryButtonTapped(category: selectedCategory)
            default:
                break
                
            }
    }
    
    
}
