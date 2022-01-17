//
//  RealTimeFirebaseManager.swift
//  InOffice
//
//  Created by Luka Muše on 11.01.2022..
//

import Foundation
import FirebaseDatabase

class RealTimeFirebaseManager {

    private var RealTimeDB = Database.database().reference()
    weak var delegate: ContentManagerDelegate?

    init() {
        fetchRealTimeData()
    }

    func fetchRealTimeData() {
        RealTimeDB.child("atOffice").observe(DataEventType.value, with: { snapshot in
            guard let children = snapshot.children.allObjects as? [DataSnapshot] else {
                return
            }

            let realUsers = children.compactMap { child in
                return child.value as? String
            }
            
        })
    }
}
extension RealTimeFirebaseManager: ContentManagerDelegate {
    func realTimeUpdate(completion: @escaping ([String]) -> Void ) {

            RealTimeDB.child("atOffice").observe(DataEventType.value, with: { snapshot in
                guard let children = snapshot.children.allObjects as? [DataSnapshot] else {
                    return
                }

                let realUsers = children.compactMap { child in
                    return child.value as? String
                }

                completion(realUsers)
                print(realUsers)
            })
    }
}
