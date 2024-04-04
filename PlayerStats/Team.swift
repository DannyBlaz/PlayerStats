//
//  Team.swift
//  PlayerStats
//
//  Created by Daniel Ezekiel on 4/2/24.
//

import Foundation

struct Team: Decodable {
    let teamID: Int
    let name: String
    let Stadium: String
    let Players: [Int]
    let teamLogo: String
}
