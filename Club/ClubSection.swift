//
//  ClubSection.swift
//  Club_Connect
//
//  Created by student on 30-04-2024.
//

import Foundation

enum ClubSection{
    case categories([ListItem])
    case myClubs([ListItem])
    case recClubs([ListItem])
    
    
    var items: [Any] {
        switch self{
        case .categories(let items):
            return items
        case .myClubs(let items):
            return items
        case .recClubs(let items):
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
        }
    }
    
}
