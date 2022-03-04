//
//  ContentManager.swift
//  InOffice
//
//  Created by Luka Muše on 14.01.2022..
//

import Foundation

protocol ContentManagerProvider {
    func getUsers()
    func getTeams(completion: @escaping (([Team]) -> Void))
    func observeRealDB()
    func filterOnlineUsers(onlineUsersIds: [String], users: [User])
}

class ContentManager: ContentManagerProvider {

    private let manager = FirebaseService()
    private let realManager: RealTimeFirebaseManagerProvider

    var users: [User] = []
    var gamingUsers: [User] = []
    var teams: [Team] = []
    var getOnlineUsers: (([User]) -> Void)?
    var getTeams: (([Team]) -> Void)?

    init() {
        realManager = RealTimeFirebaseManager()
        getUsers()
        observeRealDB()
        getGamingUsers()
    }

    func getUsers() {
        manager.fetchUsersData(completion: { users in
            self.users = users
        })
    }

    func getTeams(completion: @escaping (([Team]) -> Void)) {
        manager.fetchTeamsData(completion: { teams in
            self.teams = teams
            completion(teams)
        })

    }

    func observeRealDB() {
        realManager.realTimeUpdate { [weak self] ids in
            guard let self = self else { return }
            self.filterOnlineUsers(onlineUsersIds: ids, users: self.users)
        }
    }

    func filterOnlineUsers(onlineUsersIds: [String], users: [User]) {
        guard !onlineUsersIds.isEmpty, !users.isEmpty else {
            getOnlineUsers?([])
            return
        }

        let onlineUsers = users.filter { user in
            onlineUsersIds.contains { id in
                id == user.id
            }
        }

        getOnlineUsers?(onlineUsers)
    }

    func getGamingUsers() {
        manager.fetchGamingUsers { gamingUsers in
            self.gamingUsers = gamingUsers
        }
    }
}
