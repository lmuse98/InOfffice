//
//  TeamsViewModel.swift
//  InOffice
//
//  Created by Luka Muše on 23.02.2022..
//

import Foundation

class TeamsViewModel {

    var teams: [Team] = []

    var contentManager = ContentManager()

    init() {
        contentManager.getTeams { teams in
            self.teams = teams
        }
    }
}
