//
//  SettingGameViewcontroller.swift
//  Tic-Tac-Toe
//
//  Created by Maksim on 01.10.2024.
//

import Foundation
import UIKit

final class SettingGameViewcontroller: UIViewController {
    
    // MARK: - UI
    private lazy var backButton: UIButton = {
        let element = UIButton()
        element.setImage(K.backIcon, for: .normal)
        element.addTarget(self, action: #selector(getBackButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var gameTimeStacView: UIStackView = {
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
    
    private lazy var gameTimeView: UIView = {
        let element = UIView()
        element.backgroundColor = K.gameColor
        element.layer.cornerRadius = 30
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var gameTimeLabel: UILabel = {
        let element = UILabel()
        element.text = "Turn on the time"
        element.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var gameTimeSwitch: UISwitch = {
        let element = UISwitch()
        element.isOn = false
        element.onTintColor = K.buttonColor
        element.addTarget(self, action: #selector(gameTimeSwitchChanged(_:)), for: .valueChanged)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var durationView: UIView = {
        let element = UIView()
        element.backgroundColor = K.gameColor
        element.layer.cornerRadius = 30
        element.translatesAutoresizingMaskIntoConstraints = false
        element.isHidden = true
        return element
    }()
    
    private lazy var durationLabel: UILabel = {
        let element = UILabel()
        element.text = "Time for game"
        element.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var timeForGameValueLabel: UILabel = {
        let element = UILabel()
        element.text = "2:00"
        element.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var timeForGameArrow: UIButton = {
        let element = UIButton(type: .system)
        let image = UIImage(systemName: "chevron.right")?.withRenderingMode(.alwaysOriginal)
        element.setImage(image, for: .normal)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.showsMenuAsPrimaryAction = true
        return element
    }()
    
    private let gameTimes = [2, 3, 4]

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
        configureTimeMenu()
    }
    //MARK: - Set Views
    private func setViews() {
        view.backgroundColor = K.backgroundColor
        
        view.addSubview(backButton)
        view.addSubview(gameTimeStacView)
        
        gameTimeStacView.addArrangedSubview(gameTimeView)
        gameTimeStacView.addArrangedSubview(durationView)
        gameTimeView.addSubview(gameTimeLabel)
        durationView.addSubview(durationLabel)
        gameTimeView.addSubview(gameTimeSwitch)
        durationView.addSubview(timeForGameValueLabel)
        durationView.addSubview(timeForGameArrow)
        
    }
    
    //MARK: - Actions
    @objc private func getBackButtonTapped() {
        print("Back Button Tapped")
    }
    
    @objc private func gameTimeSwitchChanged(_ sender: UISwitch) {
        if sender.isOn {
            // Показываем durationView
            showDurationView()
        } else {
            // Скрываем durationView
            hideDurationView()
        }
        
        func showDurationView() {
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.durationView.isHidden = false
                self?.view.layoutIfNeeded()  // Обновляем интерфейс
            }
        }

        func hideDurationView() {
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.durationView.isHidden = true
                self?.view.layoutIfNeeded()  // Обновляем интерфейс
            }
        }
    }
    
    // MARK: - Configure UIMenu
    private func configureTimeMenu() {
            let menuActions = gameTimes.map { time in
                UIAction(title: "\(time):00") { [weak self] _ in
                    self?.timeForGameValueLabel.text = "\(time):00"
                }
            }
            
            let timeMenu = UIMenu(title: "", options: .displayInline, children: menuActions)
            timeForGameArrow.menu = timeMenu
        }
    
}

//MARK: - Setup Constraints

extension SettingGameViewcontroller {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: K.Size.sideConstraint),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: K.Size.sideConstraint),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 22),
            
            gameTimeStacView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: K.Size.sideConstraint),
            gameTimeStacView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: K.Size.sideConstraint),
            gameTimeStacView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -K.Size.sideConstraint),
            
            
            gameTimeView.leadingAnchor.constraint(equalTo: gameTimeStacView.leadingAnchor, constant: K.Size.sideConstraint),
            gameTimeView.trailingAnchor.constraint(equalTo: gameTimeStacView.trailingAnchor, constant: -K.Size.sideConstraint),
            gameTimeView.topAnchor.constraint(equalTo: gameTimeStacView.topAnchor, constant: K.Size.sideConstraint),
            gameTimeView.heightAnchor.constraint(equalToConstant: 70),
            
            gameTimeLabel.leadingAnchor.constraint(equalTo: gameTimeView.leadingAnchor, constant: K.Size.sideConstraint),
            gameTimeLabel.topAnchor.constraint(equalTo: gameTimeView.topAnchor, constant: K.Size.sideConstraint),
            gameTimeLabel.centerYAnchor.constraint(equalTo: gameTimeView.centerYAnchor),
            
            durationView.leadingAnchor.constraint(equalTo: gameTimeStacView.leadingAnchor, constant: K.Size.sideConstraint),
            durationView.trailingAnchor.constraint(equalTo: gameTimeStacView.trailingAnchor, constant: -K.Size.sideConstraint),
            
            durationLabel.leadingAnchor.constraint(equalTo: durationView.leadingAnchor, constant: K.Size.sideConstraint),
            durationLabel.topAnchor.constraint(equalTo: durationView.topAnchor, constant: K.Size.sideConstraint),
            durationLabel.centerYAnchor.constraint(equalTo: durationView.centerYAnchor),
            
            gameTimeSwitch.trailingAnchor.constraint(equalTo: gameTimeView.trailingAnchor, constant: -K.Size.sideConstraint),
            gameTimeSwitch.topAnchor.constraint(equalTo: gameTimeView.topAnchor, constant: K.Size.sideConstraint),
            gameTimeSwitch.centerYAnchor.constraint(equalTo: gameTimeView.centerYAnchor),
            
            timeForGameValueLabel.leadingAnchor.constraint(equalTo: durationLabel.trailingAnchor, constant: K.Size.sideConstraint),
            timeForGameValueLabel.topAnchor.constraint(equalTo: durationView.topAnchor, constant: K.Size.sideConstraint),
            timeForGameValueLabel.centerYAnchor.constraint(equalTo: durationView.centerYAnchor),
            
            timeForGameArrow.trailingAnchor.constraint(equalTo: durationView.trailingAnchor, constant: -K.Size.sideConstraint),
            timeForGameArrow.topAnchor.constraint(equalTo: durationView.topAnchor, constant: K.Size.sideConstraint),
            timeForGameArrow.centerYAnchor.constraint(equalTo: durationView.centerYAnchor),

        ])
    }
}
