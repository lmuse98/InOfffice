//
//  User.swift
//  InOffice
//
//  Created by Luka Muše on 04.01.2022..
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable, Identifiable {
    @DocumentID var id: String?
    let boss: String
    let name: String
    let photoId: String
    let role: String
    let slack: String
    let surname: String
    let team: String
}
