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

    private let manager: FirebaseService
    private let realTimeManager = RealTimeFirebaseManager()

    init() {
        manager = FirebaseService()
        contentManager.getOnlineUsers = { [weak self] users in
            self?.users = users
        }
    }
}
