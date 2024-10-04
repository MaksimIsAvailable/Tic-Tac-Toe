//
//  PlayInfoViewController.swift
//  Tic-Tac-Toe
//
//  Created by Ildar Garifullin on 02/10/2024.
//

import UIKit

class PlayInfoViewController: UIViewController {
    
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
    
    private let mainScrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = UIColor(named: "backgroundColor")
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let contentView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(named: "backgroundColor")
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private let verticalStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 10
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let horisontalStackViews: [UIStackView] = {
        var stackViews: [UIStackView] = []
        let textsForMainLabel = [
            "Draw a grid with three rows and three columns, creating nine squares in total.",
            "Players take turns placing their marker (X or O) in an empty square. To make a move, a player selects a number corresponding to the square where they want to place their marker.",
            "Player X starts by choosing a square (e.g., square 5). Player O follows by choosing an empty square (e.g., square 1). Continue alternating turns until the game ends.",
            "The first player to align three of their markers horizontally, vertically, or diagonally wins. Examples of Winning Combinations: Horizontal: Squares 1, 2, 3 or 4, 5, 6 or 7, 8, 9 Vertical: Squares 1, 4, 7 or 2, 5, 8 or 3, 6, 9 Diagonal: Squares 1, 5, 9 or 3, 5, 7"
        ]
        
        var number = 1
        for text in textsForMainLabel {
            let hStackView = UIStackView(
                arrangedSubviews: [
                    RoundView(
                        frame: CGRect.zero,
                        numberOfPosition: number
                    ),
                    RectangleView(
                        frame: CGRect.zero,
                        textForMainLabel: text
                    ),
                ],
                axis: .horizontal,
                spacing: 20,
                alignment: .top)
            
            stackViews.append(hStackView)
            number += 1
        }
        
        return stackViews
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backgroundColor")
        self.title = "How to play"
        if let customFont = UIFont(name: "SFProDisplay-Bold", size: 24) {
            navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.font: customFont
            ]
        }
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(contentView)
        contentView.addSubview(verticalStackView)
        
        for v in horisontalStackViews {
            verticalStackView.addArrangedSubview(v)
        }
    }
}

extension PlayInfoViewController {
    private func setConstraints() {
        
        let g = view.safeAreaLayoutGuide
        let cg = mainScrollView.contentLayoutGuide
        let fg = mainScrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 22),
            
            mainScrollView.leadingAnchor.constraint(equalTo: g.leadingAnchor),
            mainScrollView.topAnchor.constraint(equalTo: g.topAnchor, constant: 42),
            mainScrollView.trailingAnchor.constraint(equalTo: g.trailingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: g.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: cg.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: cg.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: cg.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: cg.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: fg.widthAnchor),
         
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -21),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
