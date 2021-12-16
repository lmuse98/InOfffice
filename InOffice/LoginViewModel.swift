//
//  LoginViewModel.swift
//  InOffice
//
//  Created by Luka Muše on 02.12.2021..
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func showError(_ error: Error, _ message: String)
}

enum LoginError: Error {
    case wrongUsername
    case wrongPassword
    case unknown
}

class LoginViewModel {

    weak var delegate: LoginViewModelDelegate?

    func sendValue(email: String, password: String) {

        guard validateEmail(email: email) else {
            delegate?.showError(LoginError.wrongUsername, "Please enter valid Email.")
            return }
        guard validatePassword(password: password) else {
            delegate?.showError(LoginError.wrongPassword, "Please enter valid password.")
            return }

    }
    func validateEmail(email: String) -> Bool {
        email.validateEmail()
    }
    func validatePassword(password: String) -> Bool {
        password.validatePassword()
    }

}
