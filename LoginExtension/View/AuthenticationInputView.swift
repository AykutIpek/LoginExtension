//
//  AuthenticationInputView.swift
//  LoginExtension
//
//  Created by aykut ipek on 2.03.2023.
//

import UIKit

final class AuthenticationInputView : UIView {
    init(image: UIImage , textfield: UITextField ) {
        super.init(frame: .zero)
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        imageView.image = image
        addSubview(imageView)
        addSubview(textfield)
        let divider = UIView()
        divider.backgroundColor = .white
        addSubview(divider)
        
        imageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.centerY.equalTo(snp.centerY)
            make.width.height.equalTo(24)
        }
        
        textfield.snp.makeConstraints { make in
            make.centerY.equalTo(snp.centerY)
            make.left.equalToSuperview().offset(40)
            make.right.equalTo(-10)
        }
        
        divider.snp.makeConstraints { make in
            make.height.equalTo(0.70)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


