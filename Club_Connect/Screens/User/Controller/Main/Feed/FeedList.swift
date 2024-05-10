//
//  FeedList.swift
//  Club_Connect
//
//  Created by student on 01-05-2024.
//

import Foundation

struct FeedListi {
    let title: String
    let description: String
    let date: Date
    let category: String
    let imageURL: String
    let clubName: String
    let imageName: String
}

class EventsThisWeek {
    var events: [FeedListi] = []
    
    init() {
        self.events = [
            FeedListi(title: "Event 1", description: "Description 1", date: Date(), category: "Music", imageURL: "url1", clubName: "Club A", imageName: "pencil.tip.crop.circle"),
            FeedListi(title: "Event 2", description: "Description 2", date: Date().addingTimeInterval(86400), category: "Sports", imageURL: "url2", clubName: "Club B", imageName: "square.and.arrow.up"),
            FeedListi(title: "Event 3", description: "Description 3", date: Date().addingTimeInterval(172800), category: "Music", imageURL: "url3", clubName: "Club C", imageName: "trash")
        ]
    }
    
    func getAllEvents() -> [FeedListi] { return self.events }
}
