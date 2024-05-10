import Foundation

// Structure to represent a club category
struct ClubCategory {
    var image: String // Image representing the category
    var categoryName: String // Name of the category
}

// Class to manage club categories
class CategoryManager {
    var allCategories: [ClubCategory] = [] // Array to hold all categories
    
    init() {
        // Initialize categories
        setupCategories()
    }
    
    // Set up initial categories
    private func setupCategories() {
        // Create category instances and add them to the array
        allCategories = [
            ClubCategory(image: "assw", categoryName: "All"),
            ClubCategory(image: "tech212", categoryName: "Tech"),
            ClubCategory(image: "spor212", categoryName: "Sports"),
            ClubCategory(image: "dance212", categoryName: "Dance")
            // Add more categories here...
        ]
    }
    
    // Get all categories
    func allCategory() -> [ClubCategory] {
        return allCategories
    }
}
