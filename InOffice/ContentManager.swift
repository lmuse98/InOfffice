//
//  ContentManager.swift
//  InOffice
//
//  Created by Luka Muše on 14.01.2022..
//

import Foundation

protocol ContentManagerProvider {
    func getUsers()
    func observeRealDB()
    func filterOnlineUsers(onlineUsersIds: [String], users: [User])
}

class ContentManager: ContentManagerProvider {

    private let manager = FirebaseManager()
    private let realManager: RealTimeFirebaseManagerProvider

    var users: [User] = []
    var getOnlineUsers: (([User]) -> Void)?

    init() {
        realManager = RealTimeFirebaseManager()
        getUsers()
        observeRealDB()
    }

    func getUsers() {
        manager.fetchData(completion: { users in
            self.users = users
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
}
