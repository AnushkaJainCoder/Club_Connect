import Foundation

enum ClubSection{
    case categories([ClubCategory])
    case myClubs([Club])
    case recClubs([Club])
    case categoryWiseFilter([Club])

    var items: [Any] {
        switch self{
        case .categories(let items):
            return items
        case .myClubs(let items):
            return items
        case .recClubs(let items):
            return items
        case .categoryWiseFilter (let items):
            return items
        
        }
    }
    
    var count: Int {
        return items.count
    }
   
    var title: String{
        switch self{
        case .categories:
            return "Categories"
        case .myClubs:
            return "My Clubs"
        case .recClubs:
            return "Recommended Clubs"
        case .categoryWiseFilter:
            return ""
        }
    }
    
}
