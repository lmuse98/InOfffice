//
//  ContentManager.swift
//  InOffice
//
//  Created by Luka Muše on 14.01.2022..
//

import Foundation

protocol ContentManagerDelegate: AnyObject {
   //  func realTimeUpdate( completion: @escaping ([String]) -> Void)
}

class ContentManager: ContentManagerDelegate {

    private let manager = FirebaseManager()
    private let realManager = RealTimeFirebaseManager()

    var users: [User] = []
    var getOnlineUsers: (([User]) -> Void)?

    init() {
        getUsers()
        observeRealDB()
        realManager.delegate = self
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
