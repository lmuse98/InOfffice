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
    var boss: String
    var name: String
    var photoId: String
    var role: String
    var slack: String
    var surname: String
    var team: String
}
