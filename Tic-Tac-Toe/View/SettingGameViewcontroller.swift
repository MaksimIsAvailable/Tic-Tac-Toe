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
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    
        let customBackButton = UIBarButtonItem(customView: element)
        navigationItem.leftBarButtonItem = customBackButton
        return element
    }()
//    MARK: Добавляю стек для выбора картинок
    
    var selectedButtonIndex = 0
    
    var buttons: [UIButton] = [] //первая кнопка не сбрасывалась
    
    var selectedIcons: [String] = []
    let imageNames = [
           "pinkXIcon", "purpleOIcon",
           "circleXIcon", "circleOIcon",
           "cakeIcon", "icecreamIcon",
           "yellowXIcon", "greenOIcon",
           "starIcon", "heartIcon",
           "burgerIcon", "potatoesIcon"
       ]

    
    private var lowerStackView: UIStackView = {
        let element = UIStackView()
        element.backgroundColor = K.backgroundColor
        element.axis = .horizontal
        element.distribution = .fillEqually
        element.spacing = 20
        return element
    }()
           
    private var  leftColumnStackView: UIStackView = {
        let element = UIStackView()
        element.backgroundColor = K.backgroundColor
        element.axis = .vertical
        element.spacing = 20
        return element
    }()
           
    private var rightColumnStackView: UIStackView = {
        let element = UIStackView()
        element.backgroundColor = K.backgroundColor
        element.axis = .vertical
        element.spacing = 20
        return element
    }()
    
    // MARK: Функция для блоков внизу
       func setCell(index: Int) -> UIView {
           let element = UIView()
           element.backgroundColor = .white
           element.layer.cornerRadius = 30
           
           let imagesStackView = UIStackView()
           imagesStackView.axis = .horizontal
           imagesStackView.spacing = 4
           imagesStackView.distribution = .fillEqually
           
           let firstImageName = imageNames[index * 2]
           let secondImageName = imageNames[index * 2 + 1]
           
           let imageView1 = UIImageView(image: UIImage(named: firstImageName))
           imageView1.contentMode = .scaleAspectFit
           imageView1.heightAnchor.constraint(equalToConstant: 70).isActive = true
           
           let imageView2 = UIImageView(image: UIImage(named: secondImageName))
           imageView2.contentMode = .scaleAspectFit
           imageView2.heightAnchor.constraint(equalToConstant: 70).isActive = true
           imagesStackView.addArrangedSubview(imageView1)
           imagesStackView.addArrangedSubview(imageView2)
                   
           let button = UIButton(type: .system)
           button.tag = index // Устанавливаем тег для идентификации кнопки
           selectedButtonIndex = UserDefaults.standard.integer(forKey: "selectedButtonIndex")
           if index == selectedButtonIndex {
               button.setTitle("Picked", for: .normal)
               button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
               button.setTitleColor(.white, for: .normal)
               button.backgroundColor = UIColor(red: 0.518, green: 0.502, blue: 0.831, alpha: 1)
           } else {
               button.setTitle("Choose", for: .normal)
               button.setTitleColor(.black, for: .normal)
               button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
               button.backgroundColor = UIColor(red: 0.902, green: 0.914, blue: 0.976, alpha: 1)
           }
           button.layer.cornerRadius = 20
           button.heightAnchor.constraint(equalToConstant: 39).isActive = true
           
           buttons.append(button) //первая кнопка не сбрасывалась
                   
           button.addTarget(self, action: #selector(desingButtonPress(_:)), for: .touchUpInside)
                   
           let blockStackView = UIStackView(arrangedSubviews: [imagesStackView, button])
           blockStackView.axis = .vertical
           blockStackView.spacing = 10
           blockStackView.alignment = .fill
           blockStackView.translatesAutoresizingMaskIntoConstraints = false
           element.addSubview(blockStackView)
                   
           NSLayoutConstraint.activate([
                blockStackView.leadingAnchor.constraint(equalTo: element.leadingAnchor, constant: 20),
                blockStackView.trailingAnchor.constraint(equalTo: element.trailingAnchor, constant: -20),
                blockStackView.topAnchor.constraint(equalTo: element.topAnchor, constant: 10),
                blockStackView.bottomAnchor.constraint(equalTo: element.bottomAnchor, constant: -20)
            ])
                   
           print("\(firstImageName) and \(secondImageName)")
            
           return element
        }
        
    // MARK: нажатиe кнопки дизайна
       @objc func desingButtonPress(_ sender: UIButton) {
//           Сбрасываем все кнопки
           for button in buttons {
                   button.setTitle("Choose", for: .normal)
                   button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
                   button.setTitleColor(.black, for: .normal)
                   button.backgroundColor = UIColor(red: 0.902, green: 0.914, blue: 0.976, alpha: 1)
           }
               sender.setTitle("Picked", for: .normal)
               sender.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
               sender.setTitleColor(.white, for: .normal)
               sender.backgroundColor = UIColor(red: 0.518, green: 0.502, blue: 0.831, alpha: 1)
               selectedButtonIndex = sender.tag // запоминаем индекс нажатой кнопки
           
                let selectedFirstIcon = imageNames[selectedButtonIndex * 2]
                let selectedSecondIcon = imageNames[selectedButtonIndex * 2 + 1]
                   
                if selectedIcons.count >= 2 {
                    selectedIcons[0] = selectedFirstIcon
                    selectedIcons[1] = selectedSecondIcon
                } else {
                    selectedIcons.append(selectedFirstIcon)
                    selectedIcons.append(selectedSecondIcon)
                }
                   
           saveImages()
           print("Selected icons: \(selectedIcons)  \(selectedIcons.count) , \(selectedButtonIndex)")

       }
    
    func saveImages() {
        let defaults = UserDefaults.standard
        defaults.set(selectedIcons, forKey: "selectedIcons")
        defaults.set(selectedButtonIndex, forKey: "selectedButtonIndex")
    }
    private func setLowerStackView() {
        view.addSubview(lowerStackView)
        lowerStackView.addArrangedSubview(leftColumnStackView)
        lowerStackView.addArrangedSubview(rightColumnStackView)
        
        // MARK: Добавляем блоки вниз
               for index in 0..<6 {
                   if index < 3 {
                       leftColumnStackView.addArrangedSubview(setCell(index: index))
                   } else {
                       rightColumnStackView.addArrangedSubview(setCell(index: index))
                   }
               }
    }
       
    
    private func setStackViewConstraints() {
        lowerStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lowerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lowerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            lowerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -33),
            lowerStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 282),
//            lowerStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -72),
            
        ])
    }

    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private lazy var gameTimeStacView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 10
        element.alignment = .center
        element.distribution = .fillEqually
        element.layer.cornerRadius = 30
//        element.backgroundColor = .green
        element.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        element.isLayoutMarginsRelativeArrangement = true
        element.layer.shadowColor = UIColor.black.cgColor
        element.layer.shadowOpacity = 0.2
        element.layer.shadowRadius = 10
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var gameTimeView: UIView = {
        let element = UIView()
        element.backgroundColor = .white
//        K.gameColor
        element.layer.cornerRadius = 30
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var gameTimeLabel: UILabel = {
        let element = UILabel()
        element.text = "Turn on the time"
        element.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
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
        element.backgroundColor = .white
//        K.gameColor
        element.layer.cornerRadius = 30
        element.translatesAutoresizingMaskIntoConstraints = false
        element.isHidden = true
        return element
    }()
    
    private lazy var durationLabel: UILabel = {
        let element = UILabel()
        element.text = "Time for game"
        element.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var timeForGameValueLabel: UILabel = {
        let element = UILabel()
        element.text = "2:00"
        element.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
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
        setStackViewConstraints()
    }
    //MARK: - Set Views
    private func setViews() {
        
        view.backgroundColor = K.backgroundColor
        
        view.addSubview(backButton)
        view.addSubview(gameTimeStacView)
        
//MARK: добавляем дизайн кнопок на экран
        setLowerStackView()

        gameTimeStacView.addArrangedSubview(gameTimeView)
        gameTimeStacView.addArrangedSubview(durationView)
        gameTimeView.addSubview(gameTimeLabel)
        durationView.addSubview(durationLabel)
        gameTimeView.addSubview(gameTimeSwitch)
        durationView.addSubview(timeForGameValueLabel)
        durationView.addSubview(timeForGameArrow)
        
        
        
        
    }
    
    //MARK: - Actions
    
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
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 22),
            
            gameTimeStacView.topAnchor.constraint(equalTo: view.topAnchor, constant: 92),
            gameTimeStacView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: K.Size.sideConstraint),
            gameTimeStacView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -K.Size.sideConstraint),
            
            
            gameTimeView.leadingAnchor.constraint(equalTo: gameTimeStacView.leadingAnchor, constant: 41),
            gameTimeView.trailingAnchor.constraint(equalTo: gameTimeStacView.trailingAnchor, constant: -39),
            gameTimeView.topAnchor.constraint(equalTo: gameTimeStacView.topAnchor, constant: K.Size.sideConstraint),
            gameTimeView.heightAnchor.constraint(equalToConstant: 60),
            
            gameTimeLabel.leadingAnchor.constraint(equalTo: gameTimeView.leadingAnchor, constant: K.Size.sideConstraint),
            gameTimeLabel.topAnchor.constraint(equalTo: gameTimeView.topAnchor, constant: K.Size.sideConstraint),
            gameTimeLabel.centerYAnchor.constraint(equalTo: gameTimeView.centerYAnchor),
            
            durationView.leadingAnchor.constraint(equalTo: gameTimeStacView.leadingAnchor, constant: 41),
            durationView.trailingAnchor.constraint(equalTo: gameTimeStacView.trailingAnchor, constant: -39),
            
            durationLabel.leadingAnchor.constraint(equalTo: durationView.leadingAnchor, constant: K.Size.sideConstraint),
            durationLabel.topAnchor.constraint(equalTo: durationView.topAnchor, constant: K.Size.sideConstraint),
            durationLabel.centerYAnchor.constraint(equalTo: durationView.centerYAnchor),
            
            gameTimeSwitch.centerYAnchor.constraint(equalTo: gameTimeView.centerYAnchor),
            gameTimeSwitch.trailingAnchor.constraint(equalTo: gameTimeView.trailingAnchor, constant: -20),
            
            
            
            timeForGameValueLabel.leadingAnchor.constraint(equalTo: durationLabel.trailingAnchor, constant: K.Size.sideConstraint),
            timeForGameValueLabel.topAnchor.constraint(equalTo: durationView.topAnchor, constant: K.Size.sideConstraint),
            timeForGameValueLabel.centerYAnchor.constraint(equalTo: durationView.centerYAnchor),
            
            timeForGameArrow.trailingAnchor.constraint(equalTo: durationView.trailingAnchor, constant: -K.Size.sideConstraint),
            timeForGameArrow.topAnchor.constraint(equalTo: durationView.topAnchor, constant: K.Size.sideConstraint),
            timeForGameArrow.centerYAnchor.constraint(equalTo: durationView.centerYAnchor),

        ])
    }
}
