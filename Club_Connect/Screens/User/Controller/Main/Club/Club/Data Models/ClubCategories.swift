//
//  CategoryOfClubs.swift
//  Club_Connect
//
//  Created by student on 04-05-2024.
//

import Foundation

struct ClubCategories{
    var image: String
    var categoryName: String
}



class CategoryManager{
    var allCategories: [ClubCategories] = []
    
    init(){
        let sports = ClubCategories(image: "tech212", categoryName: "Tech")
        let tech = ClubCategories(image: "spor212", categoryName: "Sports")
        let dance = ClubCategories(image: "dance212", categoryName: "Dance")
        let all = ClubCategories(image: "assw", categoryName: "All")
//        let sports1 = ClubCategories(image: "tech2121", categoryName: "Tech")
//        let tech1 = ClubCategories(image: "spor2121", categoryName: "Sports")
        allCategories.append(all)
        allCategories.append(sports)
        allCategories.append(tech)
        allCategories.append(dance)
       
//        allCategories.append(tech1)
    }
    func allCategory() -> [ClubCategories]{
        let clubs = CategoryManager()
        return allCategories
    }
    
}
