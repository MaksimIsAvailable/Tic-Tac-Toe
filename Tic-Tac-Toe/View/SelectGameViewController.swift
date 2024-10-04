//
//  SelectGameViewController.swift
//  Tic-Tac-Toe
//
//  Created by Maksim on 30.09.2024.
//

import Foundation
import UIKit

final class SelectGameViewController: UIViewController {
    
    // MARK: - UI
    private lazy var settingButton: UIButton = {
        let element = UIButton()
        element.setImage(K.settingIcon, for: .normal)
        element.addTarget(self, action: #selector(getSettingButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 20
        element.alignment = .center
        element.distribution = .fillEqually
        element.layer.cornerRadius = 30
        element.backgroundColor = .white
        element.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        element.isLayoutMarginsRelativeArrangement = true
        element.layer.shadowColor = UIColor.black.cgColor
        element.layer.shadowOpacity = 0.2
        element.layer.shadowRadius = 20
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var selectGameLabel: UILabel = {
        let element = UILabel()
        element.text = "Select game"
        element.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var singlePlayerButton: UIButton = {
        let element = UIButton()
        element.setImage(K.singlePlayerIcon, for: .normal)
        element.setTitle("Single player", for: .normal)
        element.setTitleColor(.black, for: .normal)
        element.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        element.imageView?.contentMode = .scaleAspectFit
        element.contentHorizontalAlignment = .center
        element.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        element.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        element.backgroundColor = K.gameColor
        element.layer.cornerRadius = 30
        element.addTarget(self, action: #selector(getSinglePlayerTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var twoPlayersButton: UIButton = {
        let element = UIButton()
        element.setImage(K.twoPlayersIcon, for: .normal)
        element.setTitle("Two players", for: .normal)
        element.setTitleColor(.black, for: .normal)
        element.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        element.imageView?.contentMode = .scaleAspectFit
        element.contentHorizontalAlignment = .center
        element.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        element.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        element.backgroundColor = K.gameColor
        element.layer.cornerRadius = 30
        element.addTarget(self, action: #selector(getTwoPlayersTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
    }
    //MARK: - Set Views
    private func setViews() {
        view.backgroundColor = K.backgroundColor
        
        view.addSubview(settingButton)
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(selectGameLabel)
        mainStackView.addArrangedSubview(singlePlayerButton)
        mainStackView.addArrangedSubview(twoPlayersButton)
        
    }
    
    //MARK: - Actions
    @objc private func getSettingButtonTapped() {
        let nextViewController = SettingGameViewcontroller()
        navigationController?.pushViewController(nextViewController, animated: true)
        print("Setting Button Tapped")
    }
    
    @objc private func getSinglePlayerTapped() {
        let nextViewController = GameViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
        print("Single Player Tapped")
    }
    
    @objc private func getTwoPlayersTapped() {
        let nextViewController = GameViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
        print("Two Players Tapped")
    }
}

//MARK: - Setup Constraints

extension SelectGameViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            settingButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: K.Size.sideConstraint),
            settingButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -K.Size.sideConstraint),
            settingButton.widthAnchor.constraint(equalToConstant: 38),
            settingButton.heightAnchor.constraint(equalToConstant: 36),
            
            mainStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: K.Size.mainStacSide),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -K.Size.mainStacSide),
            
            singlePlayerButton.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: K.Size.sideConstraint),
            singlePlayerButton.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -K.Size.sideConstraint),
            singlePlayerButton.heightAnchor.constraint(equalToConstant: K.Size.height),
            
            twoPlayersButton.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: K.Size.sideConstraint),
            twoPlayersButton.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -K.Size.sideConstraint),
            twoPlayersButton.heightAnchor.constraint(equalToConstant: K.Size.height),
            
            
        ])
    }
}

