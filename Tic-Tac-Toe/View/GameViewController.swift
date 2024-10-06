//
//  GameViewController.swift
//  Tic-Tac-Toe
//
//  Created by Павел Широкий on 30.09.2024.
//

import UIKit

class GameViewController: UIViewController {
    
    var isPlayerOneTurn = true
    var isSinglePlayer: Bool = false
    var computerMoveTimer: Timer?
    
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
        return setupMainView()
    }()
    
    private lazy var gameView: UIView = {
        return setupGameView(on: mainView)
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
    
    private lazy var gamePole: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 30
        gameView.addSubview(view)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = K.backgroundColor
        
        gamePoleFill()
        setConstraints()
    }
    
    // функция отрисовки игрового поля
    func gamePoleFill() {
        let squareWidth: CGFloat = 74
        let squareHeight: CGFloat = 73
        let padding: CGFloat = 20
        let rows = 3
        let columns = 3
        
        for row in 0..<rows {
            for column in 0..<columns {
                let squareView = UIView()
                squareView.configureSquareView(backgroundColor: UIColor(red: 0.9, green: 0.91, blue: 0.98, alpha: 1), cornerRadius: 20)
                gamePole.addSubview(squareView)
                
                let topOffset = CGFloat(row) * (squareHeight + padding) + padding
                let leftOffset = CGFloat(column) * (squareWidth + padding) + padding
                
                squareView.setConstraintsInGrid(gamePole: gamePole, topOffset: topOffset, leftOffset: leftOffset, width: squareWidth, height: squareHeight)
                
                squareView.addTapGesture(target: self, action: #selector(squareTapped(_:)))
                squareView.tag = (row * columns) + column
            }
        }
    }
    
    // обработка нажатия на View игрового поля, добавляем крестик или кружок
    @objc func squareTapped(_ sender: UITapGestureRecognizer) {
        
        guard let squareView = sender.view else { return }
        
        if squareView.subviews.count > 0 { return }
        
        if isPlayerOneTurn {
            squareView.addImageToSquare(imageName: "pinkXIcon")  //функцию для отрисовки изображения вынес в Ext
            squareView.isUserInteractionEnabled = false
            if checkForWinner() {
                navigateToResultScreen(result: .playerOne)
            } else {
                isPlayerOneTurn.toggle()
                if isSinglePlayer {
                    computerMoveTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(performComputerMove), userInfo: nil, repeats: false)
                }
            }
            
            
            
        } else {
            squareView.addImageToSquare(imageName: "purpleOIcon")
            squareView.isUserInteractionEnabled = false
            if checkForWinner() {
                navigateToResultScreen(result: .playerTwo)
            }
            isPlayerOneTurn.toggle()
        }
        
        
    }
    
    @objc func performComputerMove() {
        
        let emptySquares = gamePole.subviews.filter { $0.subviews.isEmpty && $0.isUserInteractionEnabled }
        
        if let randomSquare = emptySquares.randomElement() {
            randomSquare.addImageToSquare(imageName: "purpleOIcon")
            randomSquare.isUserInteractionEnabled = false
            if checkForWinner() {
                navigateToResultScreen(result: .playerTwo)
            } else {
                isPlayerOneTurn.toggle()
            }
        }
    }
    
    func checkForWinner() -> Bool {
        let winningCombinations: [[UIView]] = [
            // Горизонтальные линии
            [gamePole.subviews[0], gamePole.subviews[1], gamePole.subviews[2]],
            [gamePole.subviews[3], gamePole.subviews[4], gamePole.subviews[5]],
            [gamePole.subviews[6], gamePole.subviews[7], gamePole.subviews[8]],

            // Вертикальные линии
            [gamePole.subviews[0], gamePole.subviews[3], gamePole.subviews[6]],
            [gamePole.subviews[1], gamePole.subviews[4], gamePole.subviews[7]],
            [gamePole.subviews[2], gamePole.subviews[5], gamePole.subviews[8]],

            // Диагонали
            [gamePole.subviews[0], gamePole.subviews[4], gamePole.subviews[8]],
            [gamePole.subviews[2], gamePole.subviews[4], gamePole.subviews[6]]
        ]
        
        for combination in winningCombinations {
            if let firstSquare = combination.first,
               let firstImage = firstSquare.subviews.first as? UIImageView,
               let firstImageContent = firstImage.image {
                if combination.allSatisfy({ ($0.subviews.first as? UIImageView)?.image == firstImageContent }) {
                    return true
                }
            }
        }
        
        return false
    }
    
    func navigateToResultScreen(result: GameResult) {
        let resultViewController = ResultViewController()
        resultViewController.result = result 
        navigationController?.pushViewController(resultViewController, animated: true)
    }
}

// расстановка основных элементов
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
        gamePole.translatesAutoresizingMaskIntoConstraints = false
        
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
            secondPlayerLabel.bottomAnchor.constraint(equalTo: secondPlayer.bottomAnchor, constant: -10),
            
            gamePole.centerXAnchor.constraint(equalTo: gameView.centerXAnchor),
            gamePole.topAnchor.constraint(equalTo: turnLabel.bottomAnchor, constant: 45),
            gamePole.heightAnchor.constraint(equalToConstant: 299),
            gamePole.widthAnchor.constraint(equalToConstant: 302)
            
        ])
    }
}

// добавление картинки для квадрата игрового поля
extension UIView {
    func addImageToSquare(imageName: String) {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
    
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
}

// настройка view для функции gamePoleFill
extension UIView {

    func configureSquareView(backgroundColor: UIColor, cornerRadius: CGFloat) {
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setConstraintsInGrid(gamePole: UIView, topOffset: CGFloat, leftOffset: CGFloat, width: CGFloat, height: CGFloat) {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: gamePole.topAnchor, constant: topOffset),
            self.leadingAnchor.constraint(equalTo: gamePole.leadingAnchor, constant: leftOffset),
            self.widthAnchor.constraint(equalToConstant: width),
            self.heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    func addTapGesture(target: Any?, action: Selector) {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
    }
}
