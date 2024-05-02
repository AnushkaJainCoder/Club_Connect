//
//  MockData.swift
//  Club_Connect
//
//  Created by student on 25-04-2024.
//

import Foundation


import Foundation
import UIKit

struct MockData {
    static let shared = MockData()

       private var recommendedEventsManager: EventDataManager {
           return EventDataManager()
       }

       private var recommended: ListSection {
//           let recommendedEvents = recommendedEventsManager.getRecommendedEvents()
           
           let recommendedEvents = recommendedEventsManager.fetchLatestEvents(forCategory: ["sports","tech"])
           let listItems = recommendedEvents.map { ListItem(title: $0.eventName, image: $0.image, datee: nil, other: nil, desc: $0.description) }
           return .recommended(listItems)
       }

    func fetchImageRec() -> [String]{
        
        let recEvents = recommendedEventsManager.fetchLatestEvents(forCategory: ["sports","tech"])
        let images = recEvents.compactMap{$0.image}
        print(images.count)
        
        return images
        
    }

        
    
    
    private var eventsThisWeekManager: EventDataManager{
        return EventDataManager()
    }
    
    private var eventsThisWeek: ListSection {
        
        var  eventsThisWeekManagerInstance = eventsThisWeekManager
        let eventsThisWeek = eventsThisWeekManagerInstance.fetchEventDataForThisWeek()

        let listItems = eventsThisWeek.map { ListItem(title: $0.eventName, image: $0.image, datee: $0.eventDate, other: $0.clubName, desc:  $0.description) }
        return .eventsThisWeek(listItems)
    }
    
    
    private var recommendedClubsManager: RecommendedClubManager {
            return RecommendedClubManager()
        }
        
        private var recommendedClubs: ListSection {
            let clubs = recommendedClubsManager.getRecomClubs()
            let listItems = clubs.map { ListItem( title: nil, image: $0.image, datee: nil, other: nil, desc: $0.desc) }
            return .recClubs(listItems)
        }
    
//

//    private let eventsThisWeek: ListSection = {
        
        
        
        
        
        
        
//        .eventsThisWeek([
            
            
            
//            ListItems(eventName: "JustDance", dates: "8th April", clubName: "Panache Club", image: "JustDance"),
//            ListItems(eventName: "Dogtooth Sneakers", dates: "6th April", clubName: "Sneaker Society", image: "DogtoothSneakers"),
//            ListItems(eventName: "JustDance", dates: "8th April", clubName: "Panache Club", image: "JustDance")
//            ListItems(eventName: <#T##String#>, dates: <#T##String#>, clubName: <#T##String#>, image: <#T##String#>)
            
//            ListItem(title: "VOLLEY VENTURE", image: "sports"),
//            
//
//            ListItem(title: "THE NEW BUSINESS IDEAS", image: "imag9"),
//            ListItem(title: "THE HOUR OF <CODE> WAR ", image: "image7"),
//            

//            ListItem(title: "FUTURE OF MANAGEMENT EDU ", image: "Madhu")
//            ListItem(title: "  JustDance\n  8th April\n  Panache Club", image: "JustDance"),
//            
//
//            ListItem(title: "  Dog tooth Sneakers \n  6th April \n  Sneaker Socety", image: "DogtoothSneakers"),
//            ListItem(title: "  JustDance\n  8th April\n  Panache Club", image: "JustDance"),
//            

//            ListItem(title: "JustDance", image: "JustDance"),
//            ListItem(title: "Dog tooth Sneakers", image: "DogtoothSneakers"),
//            ListItem(title: "JustDance", image: "JustDance"),
//            ListItem(title: "Dog tooth Sneakers", image: "DogtoothSneakers"),
            

//        ])
//    }()

    var pageData: [ListSection] {
        return [ recommended, eventsThisWeek, recommendedClubs]
    }
}
