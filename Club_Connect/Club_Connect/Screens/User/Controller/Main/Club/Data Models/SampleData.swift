import Foundation

struct SampleData {
    // Singleton instance
    static let shared = SampleData()
    
    // Club data manager instances
    var clubData = ClubManagers()
    var clubCategory = CategoryManager()
    
    // Return section data for "My Clubs" category
    private var myClubs: ClubSection {
        let clubs = clubData.myClubs()
        let listItems = clubs.map { Club(name: $0.name, categoryName: $0.categoryName, categoryImage: nil, members: $0.members, awards: $0.awards, events: $0.events, joined: $0.joined, clubImage: $0.clubImage, clubLogo: $0.clubLogo, description: $0.description, processing: $0.processing) }
        return .myClubs(listItems)
    }
    
    // Return section data for "Recommended Clubs" category
    private var recClubs: ClubSection {
        let clubs = clubData.recommendedClubs()
        let listItems = clubs.map { Club(name: $0.name, categoryName: $0.categoryName, categoryImage: nil, members: $0.members, awards: $0.awards, events: $0.events, joined: $0.joined, clubImage: $0.clubImage, clubLogo: $0.clubLogo, description: $0.description, processing: $0.processing) }
        return .recClubs(listItems)
    }
    
    // Return section data for club categories
    private var clubCategories: ClubSection {
        let categ = clubCategory.allCategory()
        let listItems = categ.map { ClubCategory(image: $0.image, categoryName: $0.categoryName) }
        return .categories(listItems)
    }
    
    // Return an array of sections for the page
    var pageData: [ClubSection] {
        return [clubCategories, myClubs, recClubs]
    }
}
