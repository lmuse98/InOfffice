//
//  Team.swift
//  InOffice
//
//  Created by Luka Muše on 18.02.2022..
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Team: Codable, Identifiable {
    @DocumentID var id: String?
}
