//
//  Club.swift
//  Club_Connect
//
//  Created by student on 03-05-2024.
//

import Foundation
import UIKit




struct Club {
    var name: String
    var categoryName: String
    var categoryImage: String?
    var members: Int
    var awards: Int
    var events: Int
    var joined: Bool
    var clubImage: String?
    var clubLogo: String?
    var description: String
    var processing: Bool
}

class ClubManagers{
    var clubs: [Club] = []
    var joinedClubs: [Club] = []
    init() {
        
        var gfg = Club(name: "GFG", categoryName: "Tech", categoryImage: nil, members: 40, awards: 100, events: 50, joined: false, clubImage: "recClubs789", clubLogo: "gfg123", description: "GFG club description", processing: false)
        
        var c2s2 = Club(name: "C2S2", categoryName: "Dance", categoryImage: nil, members: 80, awards: 150, events: 350, joined: false, clubImage: "QWE", clubLogo: "c2s2", description: "C2S2 club is open for all students of Chitkara University, Punjab Campus. The club functions not only during the working hours of the campus, it works even when the campus working hours are over. The club intends to encourage students to learn and teach activities that interests them. The vision of C2S2 is to create a community enriched with students who are enthusiastic and are keen to learn and teach new things.", processing: false)

        var ieee = Club(name: "IEEE", categoryName: "Tech", categoryImage: nil, members: 60, awards: 60, events: 150, joined: false, clubImage: nil, clubLogo: "ieee45", description: "IEEE club description", processing: false)
        var codingNinja = Club(name: "codingNinja", categoryName: "Tech", categoryImage: nil, members: 330, awards: 100, events: 50, joined: false, clubImage: nil, clubLogo: "cn", description: "CodingNinja club description", processing: false)
//        let debsoc = Club(name: "Debsoc", categoryName: "Tech", categoryImage: nil, members: 49, awards: 20, events: 40, joined: true, clubImage: nil, clubLogo: "debsoc", description: "Debsoc club description")
        var synergy = Club(name: "Synergy", categoryName: "Sports", categoryImage: "spor212", members: 23, awards: 5, events: 10, joined: false, clubImage: nil, clubLogo: "syner", description: "Synergy club description", processing: false)
//        let iete = Club(name: "IETE", categoryName: "Cultural", categoryImage: nil, members: 6, awards: 2, events: 5, joined: false, clubImage: nil, clubLogo: nil, description: "IETE club description")
//        let bitsNBytes = Club(name: "BitsNBytes", categoryName: "Tech", categoryImage: "bnb1", members: 24, awards: 8, events: 15, joined: false, clubImage: nil, clubLogo: "bnb1", description: "BitsNBytes club description")
        
        
        
        var bitsNBytes = Club(name: "BNB", categoryName: "Tech", categoryImage: nil, members: 90, awards: 10, events: 20, joined: false, clubImage: "recClubs12345", clubLogo: "bnb1", description: "BITS ’N’ BYTES has been actively organizing many events that are aimed at nurturing computer technocrats. Since the time the club has been formed, it has been computer centric and this has yielded several benefits to its members. Members have been able to get actively involved and derive significant knowledge on computers.", processing: false)

        var ios = Club(name: "iOS", categoryName: "Tech", categoryImage: "club54", members: 24, awards: 8, events: 15, joined: false, clubImage: nil, clubLogo: "ios12", description: "iOS Apple Student Community", processing: false)
        var c2s2Nati = Club(name: "Nati", categoryName: "Dance", categoryImage: "dance212", members: 80, awards: 150, events: 350, joined: false, clubImage: nil, clubLogo: "dance212", description: "C2S2 Nati club description", processing: false)
        var c2s2Bihu = Club(name: "Bihu", categoryName: "Dance", categoryImage: "dance212", members: 80, awards: 150, events: 350, joined: false, clubImage: nil, clubLogo: "dance212", description: "C2S2 Bihu club description", processing: false)
        var c2s2Classical = Club(name: "Classical", categoryName: "Dance", categoryImage: "dance212", members: 80, awards: 150, events: 350, joined: false, clubImage: nil, clubLogo: "dance212", description: "C2S2 Classical club description", processing: false)
        var c2s2Bhangra = Club(name: "c2s2 Bhangra", categoryName: "Dance", categoryImage: nil, members: 80, awards: 150, events: 350, joined: true, clubImage: "recClubs1", clubLogo: "c2s2", description: "C2S2 club description", processing: false)
        var c2s2Giddha = Club(name: "c2s2 Giddha", categoryName: "Dance", categoryImage: nil, members: 80, awards: 150, events: 350, joined: true, clubImage: "recClubs1", clubLogo: "c2s2", description: "C2S2 club description", processing: false)
//  recClubs12345
//        recClubs789
//        recClubs1
        clubs.append(gfg)
        clubs.append(c2s2)
        clubs.append(ieee)
        // clubs.append(bnb)
        clubs.append(codingNinja)
//        clubs.append(debsoc)
        clubs.append(synergy)
//        clubs.append(iete)
        clubs.append(bitsNBytes)
        clubs.append(ios)
        clubs.append(c2s2Nati)
        clubs.append(c2s2Bihu)
        clubs.append(c2s2Classical)
        clubs.append(c2s2Bhangra)
        clubs.append(c2s2Giddha)
        
    }
    
    func clubCategories() -> [String]{
        var categor: [String] = []
        for club in clubs{
            categor.append(club.categoryName)
        }
        return categor
    }
    
    func getJoinedClubs() -> [Club]{
        return joinedClubs
    }
    
    func myClubs() -> [Club] {
        print(joinedClubs)
        for club in clubs {
            if club.joined == true && !joinedClubs.contains(where: { $0.name == club.name }) {
                joinedClubs.append(club)
            }
        }
        print(joinedClubs)
        return joinedClubs
    }
    
    func updateChanges(item: String) {
        for i in 0..<clubs.count{
            if clubs[i].name == item{
                clubs[i].processing = true
            
            }
        }
    }
    
//    func joinClub(clubName: String){
//        for club in clubs{
//            if clubName == club.name{
//                //club.joined = true
//                joinedClubs.append(club)
//            }
//        }
//    }
    
    func recommendedClubs() -> [Club]{
        if joinedClubs.isEmpty{
            return clubs
        }
        var myClubsCategory : Set<String> = []
        var recClubs: [Club] = []
        for club in joinedClubs{
         //   print(club.categoryName)
            myClubsCategory.insert(club.categoryName)
        }
    //    print(myClubsCategory.count)
        for club in clubs{
            for catg in myClubsCategory{
                if club.joined == false &&  club.categoryName == catg && club.clubImage != nil{
                    recClubs.append(club)
                    
                }
                if club.name == "BNB" && !joinedClubs.contains(where: { $0.name == club.name }){
                    recClubs.append(club)
                }
            }
        }
        
        print(recClubs)
        
        return recClubs
    }
    func categoryWiseClubs(category: String) -> [Club]{
        
        var  catWiseClubs :[Club] = []
        for club in clubs{
            if club.categoryName == category{
                catWiseClubs.append(club)
                
            }
            if club.joined == true{
                
            }
        }
        return catWiseClubs
    }
    
    
}

var club = ClubManagers()
//print(club.myClubs())
//print("helllllllllllllooo")
//print((club.recommendedClubs()))
