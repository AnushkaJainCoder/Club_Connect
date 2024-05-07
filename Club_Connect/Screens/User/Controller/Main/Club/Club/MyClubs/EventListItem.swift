


//
//  EventListItem.swift
//  EventThisWeek
//
//  Created by Student on 30/04/24.
//

import Foundation
 struct EventListItem
{
//     let title: String?
//     let image: String?
//     let date: Date?
//     let other: String?
//     let Clubtitle: String?
     
     var eventPosterImage : String
     var eventName : String
     var eventHost : String
     var eventDetails : String
 }

class EventDataModel {
    private var upcommingEventList : [EventListItem] = []
    init(){
        initializeUpcommingEventList()
    }
    private func initializeUpcommingEventList(){
        upcommingEventList = [
//            EventListItem(eventPosterImage: "feed1", eventName: "Literature Fest", eventHost: "Office Of student affairs" , eventDetails: "12 April | 2PM - 4PM | Alpha Zone"),
            EventListItem(eventPosterImage: "danc2134", eventName: "Kun Faya Kun", eventHost: "By c2s2 Dwani" , eventDetails: "16 April | 2PM - 4PM | Beta Zone"),
            EventListItem(eventPosterImage: "Shobana", eventName: "Shobana", eventHost: "By c2s2 Classicals" , eventDetails: "19 April | 2PM - 4PM | Zero Hall"),
            EventListItem(eventPosterImage: "sartaj", eventName: "Music Beats", eventHost: "c2s2 Giddha" , eventDetails: "24 April | 2PM - 4PM | Rock Zone")
        ]
    }
    func getUpcommingRventList() -> [EventListItem]{
        return upcommingEventList
    }
}
var eventDataModel = EventDataModel() // instance of class event data model

