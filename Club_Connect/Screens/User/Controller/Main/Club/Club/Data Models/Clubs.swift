//
//  Clubs.swift
//  Club_Connect
//
//  Created by student on 03-05-2024.
//

import Foundation
struct Club{
    var cliubName: String
    var clubCategory: String
    var members: Int
    var Awards: Int
    var events: Int
    var joined: Bool
}


class ClubPage{
    var clubs: [Club] = []
    var gfg = Club(cliubName: "GFG", clubCategory: "Tech", members: 80, Awards: 50, events: 12, joined: false)
    clubs.append(gfg)
    
}
