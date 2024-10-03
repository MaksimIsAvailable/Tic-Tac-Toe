//
//  OnbordingViewController.swift
//  Tic-Tac-Toe
//
//  Created by Александр Гуркин on 03.10.2024.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    //    MARK: - UI Elements
    
    private lazy var backgroundViewColor: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var logoImageView: UIImageView = {
        let element = UIImageView()
        element.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        element.image = UIImage(named: "onboardingXOIcon")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.text = "TIC-TAC-TOE"
        element.textColor = UIColor(red: 0.137, green: 0.161, blue: 0.275, alpha: 1)
        element.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        element.textAlignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let rulesButton =  UIButton(name: "rulesIcon")
    private let settingButton =  UIButton(name: "settingIcon")
    
    private lazy var actionButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = UIColor(red: 132/255, green: 128/255, blue: 212/255, alpha: 1)
        element.tintColor = .white
        element.setTitle("Let's play", for: .normal)
        element.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        element.titleLabel?.textAlignment = .center
        element.layer.cornerRadius = 30
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    //     MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setConstrains()
    }
    
    //     MARK: - UI Setup
    private func setView() {
        view.addSubview(backgroundViewColor)
        view.addSubview(titleLabel)
        view.addSubview(logoImageView)
        view.addSubview(rulesButton)
        view.addSubview(settingButton)
        view.addSubview(actionButton)
        
        rulesButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        settingButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    private func setConstrains() {
       
        NSLayoutConstraint.activate([
            backgroundViewColor.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundViewColor.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundViewColor.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundViewColor.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    
            rulesButton.widthAnchor.constraint(equalToConstant: 36),
            rulesButton.heightAnchor.constraint(equalToConstant: 36),
            rulesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  20),
            rulesButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
        
            settingButton.widthAnchor.constraint(equalToConstant: 36),
            settingButton.heightAnchor.constraint(equalToConstant: 36),
            settingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            settingButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            
            logoImageView.widthAnchor.constraint(equalToConstant: 270.07),
            logoImageView.heightAnchor.constraint(equalToConstant: 135),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.03),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 278),
            
//            titleLabel.widthAnchor.constraint(equalToConstant: 196),
//            titleLabel.heightAnchor.constraint(equalToConstant: 38),
            titleLabel.centerXAnchor.constraint(equalTo: logoImageView.centerXAnchor, constant: -1),
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 31),
            
            actionButton.widthAnchor.constraint(equalToConstant: 348),
            actionButton.heightAnchor.constraint(equalToConstant: 72),
            actionButton.centerXAnchor.constraint(equalTo: logoImageView.centerXAnchor, constant: 0),
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            
        ])
    }
    
    // MARK: - Button Action
    @objc private func buttonTapped() {
        print("Кнопка нажата!")
    }
    
}
