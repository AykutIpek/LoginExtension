//
//  SignInViewController.swift
//  LoginExtension
//
//  Created by aykut ipek on 4.03.2023.
//

import Foundation
import UIKit
import SnapKit

final class SignInViewController: UIViewController {
    // MARK: - Properties
    private var profileImageView: UIImage?
    private lazy var addCameraButton : UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.setImage(UIImage(systemName: "camera.circle"), for: .normal)
        button.addTarget(self, action: #selector(handlePhoto), for: .touchUpInside)
        return button
    }()
    private lazy var emailContainer: AuthenticationInputView = {
        let containerView = AuthenticationInputView(image: UIImage(systemName: "envelope")!, textfield: emailTextField)
        return containerView
    }()
    private lazy var nameContainer: AuthenticationInputView = {
        let containerView = AuthenticationInputView(image: UIImage(systemName: "person")!, textfield: nameTextField)
        return containerView
    }()
    private lazy var usernameContainer: AuthenticationInputView = {
        let containerView = AuthenticationInputView(image: UIImage(systemName: "person")!, textfield: usernameTextField)
        return containerView
    }()
    private lazy var passwordContainer: AuthenticationInputView = {
        let containerView = AuthenticationInputView(image: UIImage(systemName: "lock")!, textfield: passwordTextField)
        return containerView
    }()
    private let emailTextField = AuthenticationTextField(placeholder: "Email")
    private let usernameTextField = AuthenticationTextField(placeholder: "Name")
    private let nameTextField = AuthenticationTextField(placeholder: "Username")
    private let passwordTextField = AuthenticationTextField(placeholder: "Password")
    private lazy var registerButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.isEnabled = false
        button.layer.cornerRadius = 7
        return button
    }()
    private lazy var switchToLoginPage : UIButton = {
        let button = UIButton(type: .system)
        let attributedText = NSMutableAttributedString(string: "If you are a member? Go login page", attributes: [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 14)])
        button.setAttributedTitle(attributedText, for: .normal)
        button.addTarget(self, action: #selector(handleLoginPage), for: .touchUpInside)
        return button
    }()
    private lazy var stackView = UIStackView()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Selector
extension SignInViewController{
    @objc private func handlePhoto(_ sender: UIButton){
        
    }
    @objc private func handleLoginPage(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Helpers
extension SignInViewController{
    private func setupUI(){
        style()
        layout()
        configureGradient()
    }
    private func style(){
        //Stack View Style
        stackView = UIStackView(arrangedSubviews: [emailContainer,nameContainer,usernameContainer,passwordContainer,registerButton])
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fillEqually
    }
    private func layout(){
        view.addSubview(stackView)
        view.addSubview(addCameraButton)
        view.addSubview(switchToLoginPage)
        
        addCameraButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(150)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(addCameraButton.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
        }
        emailContainer.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        switchToLoginPage.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
    }
}

