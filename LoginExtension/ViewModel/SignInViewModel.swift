//
//  SignInViewModel.swift
//  LoginExtension
//
//  Created by aykut ipek on 4.03.2023.
//

import Foundation

struct SignInViewModel{
    var emailText : String?
    var nameText : String?
    var usernameText: String?
    var passwordText: String?
    
    var status: Bool{
        return emailText?.isEmpty == false && nameText?.isEmpty == false && usernameText?.isEmpty == false && passwordText?.isEmpty == false
    }
}
