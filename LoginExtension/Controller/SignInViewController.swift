//
//  SignInViewController.swift
//  LoginExtension
//
//  Created by aykut ipek on 4.03.2023.
//

import Foundation
import UIKit

final class SignInViewController: UIViewController {
    // MARK: - Properties
    private var profileImageView: UIImage?
    private lazy var addCameraButton : UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()
    private lazy var emailContainer: AuthenticationInputView = {
        let containerView = AuthenticationInputView(image: UIImage(systemName: "envelope")!, textfield: emailTextField)
    }()
    private lazy var nameContainer: AuthenticationInputView = {
        let containerView = AuthenticationInputView(image: UIImage(systemName: "person")!, textfield: nameTextField)
    }()
    private lazy var usernameContainer: AuthenticationInputView = {
        let containerView = AuthenticationInputView(image: UIImage(systemName: "person")!, textfield: usernameTextField)
    }()
    private lazy var passwordContainer: AuthenticationInputView = {
        let containerView = AuthenticationInputView(image: UIImage(systemName: "lock")!, textfield: passwordTextField)
    }()
    private let emailTextField = AuthenticationTextField(placeholder: "Email")
    private let usernameTextField = AuthenticationTextField(placeholder: "Name")
    private let nameTextField = AuthenticationTextField(placeholder: "Username")
    private let passwordTextField = AuthenticationTextField(placeholder: "Password")
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Helpers
extension SignInViewController{
    private func setupUI(){
        style()
        layout()
    }
    private func style(){
        
    }
    private func layout(){
        
    }
}

