import Foundation
import UIKit

struct ClubList {
    let cname: String
    let desc: String
    let members: Int
    let category: String
    let image: String
    let join: Bool
}

class RecommendedClubManager {
    private var clubs: [ClubList]
    
    init() {
        self.clubs = [
            ClubList(cname: "BITS ‘N’ BYTES", desc: "BITS ’N’ BYTES has been actively organizing many events that are aimed at nurturing computer technocrats. Since the time the club has been formed, it has been computer centric and this has yielded several benefits to its members. Members have been able to get actively involved and derive significant knowledge on computers.", members: 150, category: "tech", image: "recClubs12345", join:  false),
            ClubList(cname: "C2S2", desc: "C2S2 club is open for all students of Chitkara University, Punjab Campus. The club functions not only during the working hours of the campus, it works even when the campus working hours are over. The club intends to encourage students to learn and teach activities that interests them. The vision of C2S2 is to create a community enriched with students who are enthusiastic and are keen to learn and teach new things.", members: 60, category: "dance", image: "recClubs1", join: false)
        ]
    }
    
    func getRecomClubs() -> [ClubList] {
        let famousClubs = clubs.sorted {
            $0.members > $1.members
        }
        return famousClubs
    }
    
    func getRecomClubs(forCategory categories: [String]) -> [ClubList] {
        let filterClubs = clubs.filter { club in
            categories.contains(club.category) && !club.join
        }.sorted {
            $0.members > $1.members
        }
        return filterClubs
    }
}
