//
//  Extentions.swift
//  Tic-Tac-Toe
//
//  Created by Александр Гуркин on 03.10.2024.
//

import UIKit

//extension UIStackView {
//    convenience init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, subViews: [UIView]) {
//        self.init(arrangedSubviews: subViews)
//        
//        self.axis = axis
//        self.distribution = distribution
////        self.spacing = 0
//        self.translatesAutoresizingMaskIntoConstraints = false
//    }
//}

extension UIButton {
    convenience init(name: String) {
        self.init()
        self.contentMode = .scaleAspectFit
        self.setImage(UIImage(named: name), for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}


