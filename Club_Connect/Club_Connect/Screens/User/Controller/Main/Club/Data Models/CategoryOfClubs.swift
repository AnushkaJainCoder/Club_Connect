//
//  CategoryOfClubs.swift
//  Club_Connect
//
//  Created by student on 04-05-2024.
//

import Foundation

struct ClubCategory{
    var image: String
    var categoryName: String
}



class CategoryManager{
    var allCategories: [ClubCategory] = []
    
    init(){
        let sports = ClubCategory(image: "tech212", categoryName: "Tech")
        let tech = ClubCategory(image: "spor212", categoryName: "Sports")
        allCategories.append(sports)
        allCategories.append(tech)
    }
    func allCategory() -> ClubCategory{
        let clubs = ClubsViewController()
        return allCategories
    }
    
}
