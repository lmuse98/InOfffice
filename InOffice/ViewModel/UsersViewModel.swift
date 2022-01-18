//
//  UsersViewModel.swift
//  InOffice
//
//  Created by Luka Muše on 05.01.2022..
//
import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

class UsersViewModel {

    var users: [User] = []
    var contentManager = ContentManager()

    private let manager: FirebaseManager
    private let realTimeManager = RealTimeFirebaseManager()

    init() {
        manager = FirebaseManager()
        contentManager.getOnlineUsers = { [weak self] users in
            self?.users = users
        }
    }
}
