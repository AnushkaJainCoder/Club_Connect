//
//  ListItems.swift
//  Club_Connect
//
//  Created by student on 26-04-2024.
//
import Foundation

struct EventList {
    let eventName: String
    let clubName: String
    let image: String
    let description: String
    let eventDate: Date
    let registrations: Int
    let category: String
}

struct EventDataManager {
    private var events: [EventList]
    static let shared = EventDataManager()
   // let home = HomeViewController()
    
    
    lazy var today: Date = Date()
       
 
       lazy var endOfCurrentWeek: Date = {
           let startOfCurrentWeek = Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))!
           return Calendar.current.date(byAdding: .weekOfYear, value: 1, to: startOfCurrentWeek)!
       }()

    
    init() {
        self.events = [
            EventList(eventName: "  CODATHON", clubName: "Club 1", image: "image32", description: "Description of Event 1", eventDate: Date(timeIntervalSinceNow: 1720000000), registrations: 100, category: "tech"),
//            EventList(eventName: "  Fisher Mumbai India", clubName: "Club 2", image: "FisherMumbaiIndia", description: "Description of Event 2", eventDate: Date(timeIntervalSinceNow: 86400000), registrations: 200, category: "sports"),
            EventList(eventName: "  PITARA NIGHTS", clubName: "Club 3", image: "DJ2", description: "Description of Event 3", eventDate: Date(timeIntervalSinceNow: 863400000), registrations: 150, category: "sports"),
            
//dj  dj1
            EventList(eventName: "  SPORTS CHAMPIONSHIP", clubName: "Club 3", image: "Bad", description: "Description of Event 1", eventDate: Date(timeIntervalSinceNow: 86300000), registrations: 150, category: "sports"),
            
            EventList(eventName: "   DANCE COMPETETION", clubName: "Club 3", image: "DANCE", description: "Description of Event 2", eventDate: Date(timeIntervalSinceNow: 123), registrations: 150, category: "Sports"),
            EventList(eventName: "   HACKATHON", clubName: "Club 3", image: "hack", description: "Description of Event 2", eventDate: Date(timeIntervalSinceNow: 60), registrations: 150, category: "expert-Talk"),
            EventList(eventName: "   DJ NIGHT", clubName: "Club 3", image: "dj", description: "Description of Event 2", eventDate: Date(timeIntervalSinceNow: 123), registrations: 150, category: "techi"),
            
            EventList(eventName: "  ANNUAL SPORTS FEST ", clubName: "Club 3", image: "SPOR", description: "Description of Event 2", eventDate: Date(timeIntervalSinceNow: 123), registrations: 150, category: "expert-Talk"),
            
            
            
            
//            ListItem(title: "VOLLEY VENTURE", image: "sports"),
            

//            ListItem(title: "THE NEW BUSINESS IDEAS", image: "imag9"),
//            ListItem(title: "THE HOUR OF <CODE> WAR ", image: "image7"),
            

//            ListItem(title: "FUTURE OF MANAGEMENT EDU ", image: "Madhu")
            
            
        ]
    }
    
    func getCurrentDate() -> Date {
        return Date()
    }
    
    
    func getRecommendedEvents() -> [EventList] {
        let priorityEvents = events.sorted { $0.registrations > $1.registrations }
        return priorityEvents
    }
    
    func fetchLatestEvents(forCategory categories: [String]) -> [EventList] {
    //    let index = 0
        let filteredEvents = events.filter { event in
            return categories.contains(event.category)

        }
            .sorted { event1, event2 in
            return event1.eventDate > event2.eventDate
        }

        var uniqueEventTitles = Set<String>()
        var recommendedEvents: [EventList] = []
        
        for event in filteredEvents {
            if !uniqueEventTitles.contains(event.eventName) {
                uniqueEventTitles.insert(event.eventName)
                recommendedEvents.append(event)
            }
        }
        
        return recommendedEvents
    }
    

    
    mutating func fetchEventDataForThisWeek() -> [EventList] {
        let filteredEvents = events.filter { event in
            return event.eventDate > today && event.eventDate <= endOfCurrentWeek
        }
        
        return filteredEvents.map { event in
            return event
        }
    }

//    mutating 

}
