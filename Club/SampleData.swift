//
//  SampleData.swift
//  Club_Connect
//
//  Created by student on 30-04-2024.
//

import Foundation

struct SampleData{
    static let shared = SampleData()
    
    private var categor: ClubSection{
        .categories([
//            ListItem(title: "Sports", image: "tech212", datee: nil, other: nil),
//            ListItem(title: "Sports", image: "tech212", datee: nil, other: nil),
//            ListItem(title: "Sports", image: "tech212", datee: nil, other: nil),
            
            .init(title: "Sports", image: "spor212", datee: nil, other: nil),
            .init(title: "tech", image: "tech212", datee: nil, other: nil),
            .init(title: "Sports", image: "dance212", datee: nil, other: nil),
            .init(title: "Sports", image: "spor212", datee: nil, other: nil),
            .init(title: "Sports", image: "tech212", datee: nil, other: nil)
        
        ])
    }
    
    private var myClubs: ClubSection{
        .myClubs([.init(title: "Apple Student Community", image: "ios12", datee: nil, other: nil),
            .init(title: "C2S2 Custody", image: "c2s2", datee: nil, other: nil),
                  .init(title: "Apple Student Community", image: "ios12", datee: nil, other: nil),
           // .init(title: "GFG Student Chapter", image: "gfg123", datee: nil, other: nil)
                    
                    
                    
                    
                    
                    ]
        
        
        
        )
        
       
        
        
    }
    private var recClubs: ClubSection{
        .recClubs([.init(title: "GFG Student Chapter", image: "reco", datee: nil, other: nil),
         .init(title: "GFG Student Chapter", image: "reco", datee: nil, other: nil),
         .init(title: "GFG Student Chapter", image: "reco", datee: nil, other: nil),
                             
                  ])
    }
    
    var pageData: [ClubSection]{
        return [categor,myClubs, recClubs]
    }
    
}
