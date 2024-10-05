//
//  GameViewController.swift
//  Tic-Tac-Toe
//
//  Created by Павел Широкий on 30.09.2024.
//

import UIKit

class GameViewController: UIViewController {
    
    private lazy var backButton: UIButton = {
        let element = UIButton()
        element.setImage(K.backIcon, for: .normal)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        let customBackButton = UIBarButtonItem(customView: element)
        navigationItem.leftBarButtonItem = customBackButton
        
        return element
    }()
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.frame = self.view.bounds
        view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 1, alpha: 1)
        self.view.addSubview(view)
        return view
    }()
    
    private lazy var gameView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        mainView.addSubview(view)
        return view
    }()
    
    private lazy var firstPlayer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.9, green: 0.91, blue: 0.98, alpha: 1)
        view.layer.cornerRadius = 20
        gameView.addSubview(view)
        return view
    }()
    
    private lazy var firstPlayerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pinkXIcon")
        imageView.contentMode = .scaleAspectFit
        firstPlayer.addSubview(imageView)
        return imageView
    }()
    
    private lazy var firstPlayerLabel: UILabel = {
        let label = UILabel()
        label.text = "You"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        firstPlayer.addSubview(label)
        return label
    }()
    
    private lazy var secondPlayer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.9, green: 0.91, blue: 0.98, alpha: 1)
        view.layer.cornerRadius = 20
        gameView.addSubview(view)
        return view
    }()
    
    private lazy var secondPlayerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "purpleOIcon")
        imageView.contentMode = .scaleAspectFit
        secondPlayer.addSubview(imageView)
        return imageView
    }()
    
    private lazy var secondPlayerLabel: UILabel = {
        let label = UILabel()
        label.text = "Player Two"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        secondPlayer.addSubview(label)
        return label
    }()
    
    private lazy var turnLabel: UILabel = {
        let label = UILabel()
        label.text = "Turn"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        gameView.addSubview(label)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = K.backgroundColor
        
        let gamePole = UIView()
        gamePole.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        gamePole.layer.cornerRadius = 30
        gameView.addSubview(gamePole)
        
        gamePole.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            gamePole.centerXAnchor.constraint(equalTo: gameView.centerXAnchor),
            gamePole.topAnchor.constraint(equalTo: turnLabel.bottomAnchor, constant: 45),
            gamePole.heightAnchor.constraint(equalToConstant: 299),
            gamePole.widthAnchor.constraint(equalToConstant: 302)
        ])
        
        let squareWidth: CGFloat = 74
        let squareHeight: CGFloat = 73
        let padding: CGFloat = 20
        let rows = 3
        let columns = 3
        
        for row in 0..<rows {
            for column in 0..<columns {
                let squareView = UIView()
                squareView.backgroundColor = UIColor(red: 0.9, green: 0.91, blue: 0.98, alpha: 1)
                squareView.layer.cornerRadius = 20
                gamePole.addSubview(squareView)
                
                squareView.translatesAutoresizingMaskIntoConstraints = false
                
                let topOffset = CGFloat(row) * (squareHeight + padding) + padding
                let leftOffset = CGFloat(column) * (squareWidth + padding) + padding
                
                NSLayoutConstraint.activate([
                    squareView.topAnchor.constraint(equalTo: gamePole.topAnchor, constant: topOffset),
                    squareView.leadingAnchor.constraint(equalTo: gamePole.leadingAnchor, constant: leftOffset),
                    squareView.widthAnchor.constraint(equalToConstant: squareWidth),
                    squareView.heightAnchor.constraint(equalToConstant: squareHeight)
                ])
            }
        }
        
        setConstraints()
    }
    
}

extension GameViewController {
    private func setConstraints() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        gameView.translatesAutoresizingMaskIntoConstraints = false
        firstPlayer.translatesAutoresizingMaskIntoConstraints = false
        secondPlayer.translatesAutoresizingMaskIntoConstraints = false
        turnLabel.translatesAutoresizingMaskIntoConstraints = false
        firstPlayerImageView.translatesAutoresizingMaskIntoConstraints = false
        firstPlayerLabel.translatesAutoresizingMaskIntoConstraints = false
        secondPlayerImageView.translatesAutoresizingMaskIntoConstraints = false
        secondPlayerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 22),
            
            firstPlayer.leadingAnchor.constraint(equalTo: gameView.leadingAnchor, constant: 30),
            firstPlayer.topAnchor.constraint(equalTo: gameView.topAnchor, constant: 50),
            firstPlayer.widthAnchor.constraint(equalToConstant: 103),
            firstPlayer.heightAnchor.constraint(equalToConstant: 103),
            
            secondPlayer.trailingAnchor.constraint(equalTo: gameView.trailingAnchor, constant: -30),
            secondPlayer.topAnchor.constraint(equalTo: gameView.topAnchor, constant: 50),
            secondPlayer.widthAnchor.constraint(equalToConstant: 103),
            secondPlayer.heightAnchor.constraint(equalToConstant: 103),
            
            turnLabel.heightAnchor.constraint(equalToConstant: 24),
            turnLabel.centerXAnchor.constraint(equalTo: gameView.centerXAnchor),
            turnLabel.topAnchor.constraint(equalTo: firstPlayer.bottomAnchor, constant: 45),
            
            firstPlayerImageView.topAnchor.constraint(equalTo: firstPlayer.topAnchor, constant: 10),
            firstPlayerImageView.leadingAnchor.constraint(equalTo: firstPlayer.leadingAnchor, constant: 10),
            firstPlayerImageView.trailingAnchor.constraint(equalTo: firstPlayer.trailingAnchor, constant: -10),
            firstPlayerImageView.heightAnchor.constraint(equalToConstant: 60),
            
            firstPlayerLabel.topAnchor.constraint(equalTo: firstPlayerImageView.bottomAnchor, constant: 10),
            firstPlayerLabel.leadingAnchor.constraint(equalTo: firstPlayer.leadingAnchor),
            firstPlayerLabel.trailingAnchor.constraint(equalTo: firstPlayer.trailingAnchor),
            firstPlayerLabel.bottomAnchor.constraint(equalTo: firstPlayer.bottomAnchor, constant: -10),
            
            mainView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            gameView.widthAnchor.constraint(equalToConstant: 390),
            gameView.heightAnchor.constraint(equalToConstant: 844),
            gameView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -50),
            gameView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            
            secondPlayerImageView.topAnchor.constraint(equalTo: secondPlayer.topAnchor, constant: 10),
            secondPlayerImageView.leadingAnchor.constraint(equalTo: secondPlayer.leadingAnchor, constant: 10),
            secondPlayerImageView.trailingAnchor.constraint(equalTo: secondPlayer.trailingAnchor, constant: -10),
            secondPlayerImageView.heightAnchor.constraint(equalToConstant: 60),
            
            secondPlayerLabel.topAnchor.constraint(equalTo: secondPlayerImageView.bottomAnchor, constant: 5),
            secondPlayerLabel.leadingAnchor.constraint(equalTo: secondPlayer.leadingAnchor),
            secondPlayerLabel.trailingAnchor.constraint(equalTo: secondPlayer.trailingAnchor),
            secondPlayerLabel.bottomAnchor.constraint(equalTo: secondPlayer.bottomAnchor, constant: -10)
            
        ])
    }
}
