import Foundation

struct MockData {
    // MARK: - Properties
    
    // Singleton instance
    static let shared = MockData()
    
    // Manager for recommended events
    private var recommendedEventsManager: EventDataManager {
        return EventDataManager()
    }
    
    // Manager for events happening this week
    private var eventsThisWeekManager: EventDataManager {
        return EventDataManager()
    }
    
    // Manager for recommended clubs
    private var recommendedClubsManager: RecommendedClubManager {
        return RecommendedClubManager()
    }
    
    // MARK: - Methods
    
    // Fetches images of recommended events
    func fetchImageRec() -> [String] {
        let recEvents = recommendedEventsManager.fetchLatestEvents(forCategory: ["sports", "tech"])
        let images = recEvents.compactMap { $0.image }
        print(images.count)
        return images
    }
    
    // MARK: - Sections
    
    // Recommended events section
    private var recommended: ListSection {
        let recommendedEvents = recommendedEventsManager.fetchLatestEvents(forCategory: ["sports", "tech"])
        let listItems = recommendedEvents.map { ListItem(title: $0.eventName, image: $0.image, datee: nil, other: nil, desc: $0.description) }
        return .recommended(listItems)
    }
    
    // Events happening this week section
    private var eventsThisWeek: ListSection {
        var eventsThisWeekManagerInstance = eventsThisWeekManager
        let eventsThisWeek = eventsThisWeekManagerInstance.fetchEventDataForThisWeek()
        let listItems = eventsThisWeek.map { ListItem(title: $0.eventName, image: $0.image, datee: $0.eventDate, other: $0.clubName, desc:  $0.description) }
        return .eventsThisWeek(listItems)
    }
    
    // Recommended clubs section
    private var recommendedClubs: ListSection {
        let clubs = recommendedClubsManager.getRecomClubs()
        let listItems = clubs.map { ListItem( title: $0.cname, image: $0.image, datee: nil, other: nil, desc: $0.desc) }
        return .recClubs(listItems)
    }
    
    // MARK: - Page Data
    
    // Data for all sections
    var pageData: [ListSection] {
        return [recommended, eventsThisWeek, recommendedClubs]
    }
}
