//
//  Extension.swift
//  LoginExtension
//
//  Created by aykut ipek on 2.03.2023.
//

import UIKit

extension UIViewController{
    func configureGradient(){
        let gradient = CAGradientLayer()
        gradient.locations = [0,1]
        gradient.colors = [UIColor.systemBlue.cgColor, UIColor.systemPink.cgColor]
        gradient.frame = view.bounds
        gradient.zPosition = -1
        view.layer.addSublayer(gradient)
    }
}
