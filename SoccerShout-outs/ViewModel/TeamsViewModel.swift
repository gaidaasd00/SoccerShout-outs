//
//  TeamsViewModel.swift
//  SoccerShout-outs
//
//  Created by Алексей Гайдуков on 01.09.2022.
//

import Foundation

class TeamsViewModel {
    private(set) var teams: [Team] = [
        Team(id: .arsenal,
             name: "Arsenal",
             info: "Arsenal profession footbal club",
             manager: .init(name: "Mike", job: .manager),
             founded: "October 1986"
            ),
    
        Team(id: .astonVilla,
             name: "Aston Villa",
             info: "",
             manager: .init(name: "", job: .headCoach),
             founded: "November 1874"
            ),
    
        Team(id: .brighton, name: "Brighton",
             info: "",
             manager: .init(name: "", job: .headCoach),
             founded: "June 1901"
            ),
        
        Team(id: .burnley,
             name: "Burnley",
             info: "",
             manager: .init(name: "", job: .manager),
             founded: "May 1882"
            ),
        
        Team(id: .chelsea,
             name: "Chelsea",
             info: "",
             manager: .init(name: "Frank Lampard", job: .headCoach),
             founded: "March 1905"
            ),
        
        Team(id: .everton,
             name: "Everton",
             info: "",
             manager: .init(name: "Anchelotti", job: .manager),
             founded: "1878"
            ),
        
        Team(id: .fulham,
             name: "Fulham",
             info: "",
             manager: .init(name: "Parker", job: .headCoach),
             founded: "1879"
            ),
        
        Team(id: .leeds,
             name: "Leeds",
             info: "",
             manager: .init(name: "Marcelo", job: .headCoach),
             founded: "1919"
            ),
        
        Team(id: .leicester,
             name: "Leicester",
             info: "",
             manager: .init(name: "Brendan", job: .manager),
             founded: "1884"
            ),
    
        Team(id: .liverpool,
             name: "Liverpool",
             info: "",
             manager: .init(name: "Klopp", job: .manager),
             founded: "1892"
            ),
        
        Team(id: .manchesterCity,
             name: "Manchester City",
             info: "",
             manager: .init(name: "Pep", job: .manager),
             founded: "1880"
            ),
        
        Team(id: .manchesterUnited,
             name: "Manchester United",
             info: "",
             manager: .init(name: "Stive", job: .manager),
             founded: "1892"
            ),
        
        Team(id: .palace,
             name: "Cristal Palace",
             info: "",
             manager: .init(name: "Roy", job: .manager),
             founded: "1905"
            ),
        
        Team(id: .sheffield,
             name: "Sheffield",
             info: "",
             manager: .init(name: "Cris", job: .manager),
             founded: "1889"
            ),
        Team(id: .southampton,
             name: "Southampton",
             info: "",
             manager: .init(name: "Ralph", job: .manager),
             founded: "1885"
            ),
    
        Team(id: .tottenham,
             name: "Tottenham Hotspurs",
             info: "",
             manager: .init(name: "Mourinho", job: .manager)
             , founded: "1882"
            ),
        
        Team(id: .westBrom,
             name: "West Brom",
             info: "",
             manager: .init(name: "Slaven", job: .manager),
             founded: "1878"
            ),
    
        Team(id: .wolves,
             name: "Wolves",
             info: "",
             manager: .init(name: "Santo", job: .headCoach),
             founded: "1877"
            )
    ]
}
