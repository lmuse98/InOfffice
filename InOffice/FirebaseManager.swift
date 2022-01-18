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
    func fetchData(completion: @escaping ([User]) -> Void)
}

class FirebaseManager {

    private var db = Firestore.firestore()

    func fetchData( completion: @escaping ([User]) -> Void) {
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
}
