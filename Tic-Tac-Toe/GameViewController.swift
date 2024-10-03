//
//  GameViewController.swift
//  Tic-Tac-Toe
//
//  Created by Павел Широкий on 30.09.2024.
//

import UIKit

class GameViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Основная вьюха, представляющая весь экран
        let mainView = UIView()
        mainView.frame = self.view.bounds
        mainView.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 1, alpha: 1)
        self.view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // Вьюха с размерами 390x844 по центру экрана
        let gameView = UIView()
        gameView.backgroundColor = .clear
        mainView.addSubview(gameView)
        
        // Отключаем autoresizing mask для gameView и центрируем его
        gameView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            gameView.widthAnchor.constraint(equalToConstant: 390),
            gameView.heightAnchor.constraint(equalToConstant: 844),
            gameView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -50),
            gameView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)
        ])
        
        // Левый игрок (firstPlayer)
        let firstPlayer = UIView()
        firstPlayer.backgroundColor = UIColor(red: 0.9, green: 0.91, blue: 0.98, alpha: 1)
        firstPlayer.layer.cornerRadius = 20
        gameView.addSubview(firstPlayer)
        
        // Правый игрок (secondPlayer)
        let secondPlayer = UIView()
        secondPlayer.backgroundColor = UIColor(red: 0.9, green: 0.91, blue: 0.98, alpha: 1)
        secondPlayer.layer.cornerRadius = 20
        gameView.addSubview(secondPlayer)
        
        // Метка для текущего хода (turnLabel)
        let turnLabel = UILabel()
        turnLabel.text = "Turn"
        turnLabel.textAlignment = .center
        turnLabel.textColor = .black
        turnLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        gameView.addSubview(turnLabel)
        
        // Настраиваем позиции firstPlayer и secondPlayer
        firstPlayer.translatesAutoresizingMaskIntoConstraints = false
        secondPlayer.translatesAutoresizingMaskIntoConstraints = false
        turnLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Позиционирование firstPlayer в левом верхнем углу
            firstPlayer.leadingAnchor.constraint(equalTo: gameView.leadingAnchor, constant: 30),
            firstPlayer.topAnchor.constraint(equalTo: gameView.topAnchor, constant: 50),
            firstPlayer.widthAnchor.constraint(equalToConstant: 103),
            firstPlayer.heightAnchor.constraint(equalToConstant: 103),
            
            // Позиционирование secondPlayer в правом верхнем углу
            secondPlayer.trailingAnchor.constraint(equalTo: gameView.trailingAnchor, constant: -30),
            secondPlayer.topAnchor.constraint(equalTo: gameView.topAnchor, constant: 50),
            secondPlayer.widthAnchor.constraint(equalToConstant: 103),
            secondPlayer.heightAnchor.constraint(equalToConstant: 103),
            
            // Позиционирование turnLabel на 45 пикселей ниже firstPlayer и secondPlayer
            turnLabel.heightAnchor.constraint(equalToConstant: 24),
            turnLabel.centerXAnchor.constraint(equalTo: gameView.centerXAnchor),
            turnLabel.topAnchor.constraint(equalTo: firstPlayer.bottomAnchor, constant: 45)
        ])
        
        // Вью для игрового поля (gamePole)
        let gamePole = UIView()
        gamePole.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        gamePole.layer.cornerRadius = 30
        gameView.addSubview(gamePole)
        
        // Отключаем autoresizing mask для gamePole и настраиваем его позицию
        gamePole.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Позиционирование gamePole на 45 пикселей ниже turnLabel
            gamePole.centerXAnchor.constraint(equalTo: gameView.centerXAnchor),
            gamePole.topAnchor.constraint(equalTo: turnLabel.bottomAnchor, constant: 45),
            gamePole.heightAnchor.constraint(equalToConstant: 299),
            gamePole.widthAnchor.constraint(equalToConstant: 302)
        ])
        
        // Добавляем 9 одинаковых вьюшек в gamePole
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
                
                // Отключаем autoresizing mask
                squareView.translatesAutoresizingMaskIntoConstraints = false
                
                // Рассчитываем позицию для каждой вью
                let topOffset = CGFloat(row) * (squareHeight + padding) + padding
                let leftOffset = CGFloat(column) * (squareWidth + padding) + padding
                
                // Устанавливаем ограничения
                NSLayoutConstraint.activate([
                    squareView.topAnchor.constraint(equalTo: gamePole.topAnchor, constant: topOffset),
                    squareView.leadingAnchor.constraint(equalTo: gamePole.leadingAnchor, constant: leftOffset),
                    squareView.widthAnchor.constraint(equalToConstant: squareWidth),
                    squareView.heightAnchor.constraint(equalToConstant: squareHeight)
                ])
            }
        }
    }
    
}
