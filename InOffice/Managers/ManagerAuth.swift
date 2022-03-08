//
//  ManagerAuth.swift
//  InOffice
//
//  Created by Luka Muše on 30.11.2021..
//

import Foundation

protocol ManagerAuthProvider {
    func registerUser()
    func loginUser()
    func logoutUser()
}

class ManagerAuth: ManagerAuthProvider {

    static let sharedInstance = ManagerAuth()

    private init() {}

    func registerUser() {

    }

    func loginUser() {

    }

    func logoutUser() {

    }
}
