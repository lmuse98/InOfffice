//
//  FirebaseManager.swift
//  InOffice
//
//  Created by Luka Muše on 10.01.2022..
//

import Foundation
import Firebase
import FirebaseFirestore

protocol FirebaseManagerDelegate: AnyObject {
    func fetchUsersData(completion: @escaping ([User]) -> Void)
    func fetchTeamsData(completion: @escaping ([Team]) -> Void)
}

class FirebaseService {

    private var db = Firestore.firestore()

    func fetchUsersData( completion: @escaping ([User]) -> Void) {
        db.collection("users").addSnapshotListener { ( querySnapshot, error ) in
            if let error = error {
                print("Error getting users: \(error.localizedDescription)")
                return
            }

            let users = querySnapshot?.documents.compactMap({ document in
                return try? document.data(as: User.self)
            }) ?? []
            completion(users)
        }
    }

    func fetchGamingUsers( completion: @escaping ([User]) -> Void) {
        db.collection("users").whereField("team", isEqualTo: "Gaming").addSnapshotListener { ( querySnapshot, error ) in
            if let error = error {
                print("Error getting users: \(error.localizedDescription)")
                return
            }

            let gamingUsers = querySnapshot?.documents.compactMap({ document in
                return try? document.data(as: User.self)
            }) ?? []
            completion(gamingUsers)
            debugPrint(gamingUsers)
        }
    }

    func fetchTeamsData( completion: @escaping ([Team]) -> Void) {
        db.collection("teams").addSnapshotListener { ( querySnapshot, error ) in
            if let error = error {
                print("Error getting teams: \(error.localizedDescription)")
                return
            }

            let teams = querySnapshot?.documents.compactMap({ document in
                return try? document.data(as: Team.self)
            }) ?? []
            completion(teams)
        }
    }
}
