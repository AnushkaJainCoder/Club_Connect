//
//  SampleData.swift
//  Club_Connect
//
//  Created by student on 30-04-2024.
//

import Foundation

struct SampleData{
//    var sampleClubdata: Club
//    var newData: String/
    
    static let shared = SampleData()
    
    
    
    
//    private myClubs: ClubManager{
//        return myClubs()
//    }
//    private var myClubsSection: ClubSection{
//        let clubs =
//    }
    
//    private var myClubsManager: ClubManagers {
//        return ClubManagers()
//            }
//  
        var clubData = ClubManagers()
        var clubCategory = CategoryManager()
    
    
        private var myClubs: ClubSection {
            let clubs = clubData.myClubs()
            let listItems = clubs.map { Club(name: $0.name, categoryName: $0.categoryName,categoryImage: nil, members: $0.members, awards: $0.awards, events: $0.events, joined: $0.joined, clubImage: $0.clubImage,clubLogo: $0.clubLogo, description: $0.description, processing: $0.processing) }
            return .myClubs(listItems)
       }
    private var recClubs: ClubSection{
        let clubs = clubData.recommendedClubs()
        let listItems = clubs.map{Club(name: $0.name, categoryName: $0.categoryName,categoryImage: nil, members: $0.members, awards: $0.awards, events: $0.events, joined: $0.joined, clubImage: $0.clubImage,clubLogo: $0.clubLogo,  description: $0.description, processing: $0.processing) }
        return .recClubs(listItems)
    }
    
    private var clubCategories: ClubSection{
        let categ = clubCategory.allCategory()
        let listitems = categ.map{ClubCategories(image: $0.image, categoryName: $0.categoryName)}
        return .categories(listitems)
        
    }
    
     
    
    
//    private var recommendedClubsManager: RecommendedClubManager {
//            return RecommendedClubManager()
//        }
//
//        private var recommendedClubs: ListSection {
//            let clubs = recommendedClubsManager.getRecomClubs()
//            let listItems = clubs.map { ListItem( title: nil, image: $0.image, datee: nil, other: nil, desc: $0.desc) }
//            return .recClubs(listItems)
//        }
 
    
    
//    private var category: ClubSection{
//        .categories([
////            ListItem(title: "Sports", image: "tech212", datee: nil, other: nil),
////            ListItem(title: "Sports", image: "tech212", datee: nil, other: nil),
////            ListItem(title: "Sports", image: "tech212", datee: nil, other: nil),
//            
//            .init(title: "Sports", image: "spor212", datee: nil, other: nil, desc: "aBS"),
//            .init(title: "tech", image: "tech212", datee: nil, other: nil,desc: "tECHNICAL"),
//            .init(title: "Sports", image: "dance212", datee: nil, other: nil,desc: "dANCE"),
//            .init(title: "Sports", image: "spor212", datee: nil, other: nil,desc: "sPOSRTS"),
//            .init(title: "Sports", image: "tech212", datee: nil, other: nil,desc: "TECHNICAL")
//        
//        ])
//    }
    
//    private var myClubs: ClubSection{
//        .myClubs([.init(title: "Apple Student Community", image: "ios12", datee: nil, other: nil,desc: "aBS"),
//            .init(title: "C2S2 Custody", image: "c2s2", datee: nil, other: nil,desc: "aBS"),
//                  .init(title: "Apple Student Community", image: "ios12", datee: nil, other: nil,desc: "aBS"),
//           // .init(title: "GFG Student Chapter", image: "gfg123", datee: nil, other: nil)
//                    
//                    
//                    
//                    
//                    
//                    ]
//        
//        
//        
//        )
//        
//       
//        
//        
//    }
//    private var recClubs: ClubSection{
//        .recClubs([.init(title: "GFG Student Chapter", image: "reco", datee: nil, other: nil, desc: "GeeksforGeeks is a leading platform that provides computer science resources and coding challenges for programmers and technology enthusiasts, along with interview and exam preparations for upcoming aspirants."),
//         .init(title: "GFG Student Chapter", image: "reco", datee: nil, other: "GFG Student Chapter", desc: nil),
//         .init(title: "GFG Student Chapter", image: "reco", datee: nil, other: "GFG Student ChapterGFG Student ChapterGFG Student Chapter", desc: nil),
//                             
//                  ])
//    }
    
    var pageData: [ClubSection]{
        return [clubCategories, myClubs, recClubs]
    }
    
}
