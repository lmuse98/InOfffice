//
//  ProfileDetailsViewModel.swift
//  InOffice
//
//  Created by Luka Muše on 21.12.2021..
//

import Foundation

protocol ProfileDetailsViewModelDelegate: AnyObject {
    func show(user: User)
}

class ProfileDetailsViewModel {

    weak var delegate: ProfileDetailsViewModelDelegate?
    let user: User

    init(user: User) {
        self.user = user
    }

    func showDetails() {
        delegate?.show(user: user)
    }

    func loaded() {
        showDetails()
    }
}
