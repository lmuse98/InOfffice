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

    weak var delegate: UsersViewModelDelegate?

    var users = [User]() {
        didSet {
            delegate?.reloadData()
        }
    }
    
    private var db = Firestore.firestore()

    init() {
        fetchData()
        dump(self.users)
    }

    func fetchData() {
        db.collection("users").addSnapshotListener { ( querySnapshot, error ) in
            if let error = error {
                print("Error getting users: \(error.localizedDescription)")
                return
            }

            querySnapshot?.documents.forEach { [weak self] document in
                guard let document = try? document.data(as: User.self) else {
                    return
                }
                self?.users.append(document)
                debugPrint(document)
            }
        }
    }
}
