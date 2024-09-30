//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Maksim on 29.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //    MARK: - UI Elements
    var backgroundViewColor: UIView = {
        let background = UIView()
        background.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        imageView.image = UIImage(named: "onboardingXOIcon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TIC-TAC-TOE"
        label.textColor = UIColor(red: 0.137, green: 0.161, blue: 0.275, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 32)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rulesButton: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFit
        button.setImage(UIImage(named: "rulesIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    let settingButton: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFit
        button.setImage(UIImage(named: "settingIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    let actionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 132/255, green: 128/255, blue: 212/255, alpha: 1)
        button.titleLabel?.frame = CGRect(x: 0, y: 0, width: 83, height: 24)
        button.tintColor = .white
        button.setTitle("Let's play", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
    }()
    //     MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    //     MARK: - UI Setup
    private func setupUI() {
        view.addSubview(backgroundViewColor)
        view.addSubview(titleLabel)
        view.addSubview(logoImageView)
        view.addSubview(rulesButton)
        view.addSubview(settingButton)
        view.addSubview(actionButton)
        // Constraints
        NSLayoutConstraint.activate([
            backgroundViewColor.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundViewColor.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundViewColor.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundViewColor.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 36),
            rulesButton.heightAnchor.constraint(equalToConstant: 36),
            rulesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            rulesButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70)
        ])
        
        NSLayoutConstraint.activate([
            settingButton.widthAnchor.constraint(equalToConstant: 36),
            settingButton.heightAnchor.constraint(equalToConstant: 36),
            settingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            settingButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70)
        ])
        
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 270.07),
            logoImageView.heightAnchor.constraint(equalToConstant: 135),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.03),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 278)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalToConstant: 196),
            titleLabel.heightAnchor.constraint(equalToConstant: 38),
            titleLabel.centerXAnchor.constraint(equalTo: logoImageView.centerXAnchor, constant: -1),
            titleLabel.bottomAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 31)
        ])
        
        NSLayoutConstraint.activate([
            actionButton.widthAnchor.constraint(equalToConstant: 348),
            actionButton.heightAnchor.constraint(equalToConstant: 72),
            actionButton.centerXAnchor.constraint(equalTo: logoImageView.centerXAnchor, constant: 0),
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
        ])
        
    }
    // MARK: - Button Action
    @objc private func buttonTapped() {
        print("Кнопка нажата!")
    }
    
}
