//
//  ContentManager.swift
//  InOffice
//
//  Created by Luka Muše on 14.01.2022..
//

import Foundation

protocol ContentManagerDelegate: AnyObject {
    func realTimeUpdate( completion: @escaping ([String]) -> Void)
}

class ContentManager: ContentManagerDelegate {
    func realTimeUpdate(completion: @escaping ([String]) -> Void) {
        
    }

    private let manager = FirebaseManager()
    private let realManager = RealTimeFirebaseManager()


    var users: [User] = []
    var realUsers: [String] = []

    init() {
        getUsers()
        observeRealDB()
        realManager.delegate = self
    }

    func getUsers() {
        manager.fetchData(completion: { users in
            self.users = users
            print(users)
        })
    }

    func observeRealDB() {
        
    }
}
