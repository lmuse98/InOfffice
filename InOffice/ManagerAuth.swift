//
//  ManagerAuth.swift
//  InOffice
//
//  Created by Luka Muše on 30.11.2021..
//

import Foundation

class ManagerAuth: ManagerProviderDelegate {
    
    static let sharedInstance = ManagerAuth()
    
    private init(){}
    
    
    
    @objc func registerUser() {
        
    }
    
    @objc func loginUser() {
        
    }
    
    @objc func logoutUser() {
        
    }
}

protocol ManagerProviderDelegate: AnyObject {
    func registerUser()
    func loginUser()
    func logoutUser()
    
}
