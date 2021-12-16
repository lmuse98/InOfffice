//
//  ManagerAuth.swift
//  InOffice
//
//  Created by Luka Muše on 30.11.2021..
//

import Foundation

class ManagerAuth: ManagerProvider {

    static let sharedInstance = ManagerAuth()

    private init() {}

    func registerUser() {

    }

    func loginUser() {

    }

    func logoutUser() {

    }
}

protocol ManagerProvider {
    func registerUser()
    func loginUser()
    func logoutUser()

}
