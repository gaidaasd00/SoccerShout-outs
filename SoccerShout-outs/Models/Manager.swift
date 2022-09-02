//
//  Manager.swift
//  SoccerShout-outs
//
//  Created by Алексей Гайдуков on 01.09.2022.
//

import Foundation

enum JobType: String {
    case manager = "Manager"
    case headCoach = "Head Coach"
}

struct Manager {
    let name: String
    let job: JobType
}
