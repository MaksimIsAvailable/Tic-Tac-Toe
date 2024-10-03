//
//  SettingsGameViewController.swift
//  Tic-Tac-Toe
//
//  Created by Ildar Garifullin on 03/10/2024.
//

import UIKit

class SettingsGameViewController: UIViewController {
    
    var horizontalStackView = UIStackView()
//    var verticalStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.8718322515, green: 0.8867664933, blue: 0.9465543628, alpha: 1)
       
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        horizontalStackView = UIStackView(
            arrangedSubviews: [
                DesignSelectionView(
                    frame: CGRect.zero,
                    leftImageNamed: "cakeIcon",
                    rightImageNamed: "icecreamIcon"),
                DesignSelectionView(
                    frame: CGRect.zero,
                    leftImageNamed: "burgerIcon",
                    rightImageNamed: "potatoesIcon")
            ],
            axis: .horizontal,
            spacing: 20,
            alignment: .center)
        
        view.addSubview(horizontalStackView)
    }
}

extension SettingsGameViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            horizontalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -33),
            horizontalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
}
