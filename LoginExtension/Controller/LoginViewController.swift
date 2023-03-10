//
//  ViewController.swift
//  LoginExtension
//
//  Created by aykut ipek on 2.03.2023.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    // MARK: - Properties
    private var viewModel = LoginViewModel()
    private let logoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "apple.logo")
        imageView.tintColor = .white
        return imageView
    }()
    private lazy var emailContainer: AuthenticationInputView = {
        let containerView = AuthenticationInputView(image: UIImage(systemName: "envelope")!, textfield: emailTextField)
        return containerView
    }()
    private lazy var emailTextField : AuthenticationTextField = {
        let emailText = AuthenticationTextField(placeholder: "Email")
        emailText.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        return emailText
    }()
    private lazy var passwordContainer: AuthenticationInputView = {
        let containerView = AuthenticationInputView(image: UIImage(systemName: "lock")!, textfield: passwordTextField)
        return containerView
    }()
    private lazy var passwordTextField : AuthenticationTextField = {
        let textField = AuthenticationTextField(placeholder: "Password")
        textField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        textField.isSecureTextEntry = true
        return textField
    }()
    private lazy var stackView = UIStackView()
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.isEnabled = false
        button.layer.cornerRadius = 7
        return button
    }()
    private lazy var switchToRegisterationPage: UIButton = {
        let button = UIButton(type: .system)
        let attributedText = NSMutableAttributedString(string: "Click to become a member", attributes: [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 14)])
        button.setAttributedTitle(attributedText, for: .normal)
        button.addTarget(self, action: #selector(handleSigninScreen), for: .touchUpInside)
        return button
    }()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
// MARK: - Helpers
extension LoginViewController{
    @objc private func handleTextChange(_ sender: UITextField){
        if sender == emailTextField{
            viewModel.emailTextField = sender.text
        }else{
            viewModel.passwordTextField = sender.text
        }
        loginButtonStatus()
    }
    @objc private func handleSigninScreen(_ sender: UIButton){
        let registerPage = SignInViewController()
        self.navigationController?.pushViewController(registerPage, animated: true)
    }
}


// MARK: - Helpers
extension LoginViewController{
    private func setupUI(){
        style()
        layout()
        configureGradient()
    }
    private func style(){
        self.navigationController?.navigationBar.isHidden = true
        
        //Stack View style
        stackView = UIStackView(arrangedSubviews: [emailContainer , passwordContainer, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 14
        stackView.distribution = .fillEqually
        
        
    }
    private func layout(){
        view.addSubview(logoView)
        view.addSubview(stackView)
        view.addSubview(switchToRegisterationPage)
        
        logoView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.width.equalTo(100)
            make.height.equalTo(115)
            make.centerX.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(logoView.snp.bottom).offset(32)
            make.left.equalTo(view.snp.left).offset(32)
            make.right.equalTo(view.snp.right).offset(-32)
        }
        
        emailContainer.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        switchToRegisterationPage.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
    }
    private func loginButtonStatus(){
        if viewModel.status{
            loginButton.isEnabled = true
            loginButton.backgroundColor = .systemBlue
        }else{
            loginButton.isEnabled = false
            loginButton.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        }
    }
}

