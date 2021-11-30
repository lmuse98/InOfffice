//
//  String.swift
//  InOffice
//
//  Created by Luka Muše on 29.11.2021..
//

import Foundation

extension String {
    
     func validateEmail() -> Bool {
        let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return applyReg(regexStr: email)
    }
    
    func validatePassword(min: Int = 8, max: Int = 8) -> Bool {
        var passw = ""
        if min >= max {
            passw = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(min),}$"
        }else {
            passw = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(min),\(max)}$"
        }
        return applyReg(regexStr: passw)
    }
    
    func applyReg(regexStr: String) -> Bool {
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateOtherString = NSPredicate(format: "SELF MATCHES %@", regexStr)
        let isValidateOtherString = validateOtherString.evaluate(with: trimmedString)
        return isValidateOtherString
    }
}
