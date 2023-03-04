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
    private lazy var viewModel = SignInViewModel()
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
    private let passwordTextField: AuthenticationTextField = {
        let textField = AuthenticationTextField(placeholder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    private lazy var registerButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.isEnabled = false
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(handleRegisterButton), for: .touchUpInside)
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
        let picker = UIImagePickerController()
        picker.delegate = self
        self.present(picker,animated: true)
    }
    @objc private func handleLoginPage(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    @objc private func handleRegisterButton(_ sender: UIButton){
        
    }
    @objc private func handleTextChanged(_ sender: UITextField){
        if sender == emailTextField{
            viewModel.emailText = sender.text
        }else if sender == nameTextField{
            viewModel.nameText = sender.text
        }else if sender == usernameTextField{
            viewModel.usernameText = sender.text
        }else{
            viewModel.passwordText = sender.text
        }
        registerButtonStatus()
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
        
        //Text Changed Event
        emailTextField.addTarget(self, action: #selector(handleTextChanged), for: .editingChanged)
        nameTextField.addTarget(self, action: #selector(handleTextChanged), for: .editingChanged)
        usernameTextField.addTarget(self, action: #selector(handleTextChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(handleTextChanged), for: .editingChanged)
        
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
    private func registerButtonStatus(){
        if viewModel.status{
            registerButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            registerButton.isEnabled = true
        }else{
            registerButton.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            registerButton.isEnabled = false
        }
    }
}

//MARK: - UIImagePickerControllerDelegate & UINavigationControllerDelegate
extension SignInViewController: UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        addCameraButton.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        addCameraButton.layer.cornerRadius = 150 / 2
        addCameraButton.clipsToBounds = true
        addCameraButton.layer.borderColor = UIColor.white.cgColor
        addCameraButton.layer.borderWidth = 2
        addCameraButton.contentMode = .scaleAspectFill
        dismiss(animated: true)
    }
}
