//
//  UserModel.swift
//  InOffice
//
//  Created by Luka Muše on 10.12.2021..
//

import Foundation
import UIKit

struct UserModel {
    let profilePic: UIImage
    let userName: String
    let description: String

    static func getList() -> [UserModel] {
        let list = [
            UserModel(profilePic: Images.jackie, userName: "Valentino", description: "IOS"),
            UserModel(profilePic: Images.adria, userName: "Adriana", description: "Android"),
            UserModel(profilePic: Images.james, userName: "James", description: "QA")
        ]
        return (list)
    }
}
