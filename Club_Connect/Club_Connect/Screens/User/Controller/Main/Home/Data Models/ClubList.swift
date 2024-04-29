//
//  ClubList.swift
//  Club_Connect
//
//  Created by student on 28-04-2024.
//

import Foundation
import UIKit

struct ClubList{
    let cname: String
    let desc: String
    let members: Int
    let category: String
    let image: String
    let join: Bool
}


class RecommendedClubManager{
    
    private var clubs : [ClubList]
    init(){
        self.clubs = [
        ClubList(cname: "", desc: "gfg", members: 70, category: "tech", image: "gfg", join: false),
        
        ClubList(cname: "", desc: "bnb", members: 50, category: "tech", image: "bnb", join:  false),
        ClubList(cname: "", desc: "ieee", members: 60, category: "tech", image: "ieee", join: false),
        
        ]
    }
    
    func getRecomClubs() -> [ClubList]{
        
        let famousClubs = clubs.sorted{
            $0.members > $1.members
        }
        print("hello\(famousClubs.count)")
        
        
        return famousClubs
    }
    
    
    
    func getRecomClubs(forCategory Categories: [String]) -> [ClubList]{
        
        let filterClubs = clubs.filter{clubs in (Categories.contains(clubs.category)) && !clubs.join}.sorted{
            $0.members > $1.members
        }
        return filterClubs
        
    }
    
    
}
