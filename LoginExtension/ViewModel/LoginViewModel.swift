//
//  LoginViewModel.swift
//  LoginExtension
//
//  Created by aykut ipek on 4.03.2023.
//

import Foundation

struct LoginViewModel {
    var emailTextField: String?
    var passwordTextField: String?
    var status: Bool{
        return emailTextField?.isEmpty == false && passwordTextField?.isEmpty == false
    }
}
