//
//  AuthenticationTextField.swift
//  LoginExtension
//
//  Created by aykut ipek on 2.03.2023.
//

import UIKit

final class AuthenticationTextField: UITextField{
    init(placeholder: String) {
        super.init(frame: .zero)
        attributedPlaceholder = NSMutableAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor.white])
        borderStyle = .none
        textColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
