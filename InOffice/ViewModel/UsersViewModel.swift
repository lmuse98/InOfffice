//
//  UsersViewModel.swift
//  InOffice
//
//  Created by Luka Muše on 05.01.2022..
//
import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

protocol UsersViewModelDelegate: AnyObject {
    func reloadData()
}

class UsersViewModel {

    var users: [User] = []

    weak var delegate: UsersViewModelDelegate?

    private let manager = FirebaseManager()
    private let realTimeManager = RealTimeFirebaseManager()

    init() {
        manager.fetchData { users in
            self.users = users
            self.delegate?.reloadData()
        }
    }
}
