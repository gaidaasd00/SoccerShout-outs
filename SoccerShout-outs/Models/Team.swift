//
//  Team.swift
//  SoccerShout-outs
//
//  Created by Алексей Гайдуков on 01.09.2022.
//

import Foundation

class Team {
    let id: TeamType
    let name: String
    let info: String
    let manager: Manager
    let founded: String
    var isPlaing: Bool
    
    internal init(id: TeamType, name: String, info: String, manager: Manager, founded: String, isPlaing: Bool = false) {
        self.id = id
        self.name = name
        self.info = info
        self.manager = manager
        self.founded = founded
        self.isPlaing = isPlaing
    }
}
