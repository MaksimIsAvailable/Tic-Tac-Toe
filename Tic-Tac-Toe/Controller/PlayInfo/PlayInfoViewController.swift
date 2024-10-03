//
//  PlayInfoViewController.swift
//  Tic-Tac-Toe
//
//  Created by Ildar Garifullin on 02/10/2024.
//

import UIKit

class PlayInfoViewController: UIViewController {
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
       
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(contentView)
        
        view.addSubview(horisontalStackViews[0])
        view.addSubview(horisontalStackViews[1])
        view.addSubview(horisontalStackViews[2])
        view.addSubview(horisontalStackViews[3])
        
        horisontalStackViews[0].translatesAutoresizingMaskIntoConstraints = false
        horisontalStackViews[1].translatesAutoresizingMaskIntoConstraints = false
        horisontalStackViews[2].translatesAutoresizingMaskIntoConstraints = false
        horisontalStackViews[3].translatesAutoresizingMaskIntoConstraints = false
        
        let hConst = contentView.heightAnchor.constraint(equalTo: mainScrollView.heightAnchor)
        hConst.isActive = true
        hConst.priority = UILayoutPriority(500)
    }
}

extension PlayInfoViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 42),
            mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
       
            contentView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor),
            //            contentView.heightAnchor.constraint(equalTo: mainScrollView.heightAnchor, multiplier: 2),
  
            horisontalStackViews[0].leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
            horisontalStackViews[0].topAnchor.constraint(equalTo: contentView.topAnchor),
            horisontalStackViews[0].trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -21),
            //            horisontalStackViews[0].widthAnchor.constraint(equalTo: contentView.widthAnchor),
            //            horisontalStackViews[0].heightAnchor.constraint(equalToConstant: 75)
     
            horisontalStackViews[1].leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
            horisontalStackViews[1].topAnchor.constraint(equalTo: horisontalStackViews[0].bottomAnchor, constant: 10),
            horisontalStackViews[1].trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -21),
            //            horisontalStackViews[1].widthAnchor.constraint(equalTo: contentView.widthAnchor),
            //            horisontalStackViews[1].heightAnchor.constraint(equalToConstant: 192)

            horisontalStackViews[2].leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
            horisontalStackViews[2].topAnchor.constraint(equalTo: horisontalStackViews[1].bottomAnchor, constant: 10),
            horisontalStackViews[2].trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -21),
            //            horisontalStackViews[2].widthAnchor.constraint(equalTo: contentView.widthAnchor),
            //            horisontalStackViews[2].heightAnchor.constraint(equalToConstant: 171)

            horisontalStackViews[3].leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
            horisontalStackViews[3].topAnchor.constraint(equalTo: horisontalStackViews[2].bottomAnchor, constant: 10),
            horisontalStackViews[3].trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -21),
            horisontalStackViews[3].bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            //            horisontalStackViews[3].widthAnchor.constraint(equalTo: contentView.widthAnchor),
            //            horisontalStackViews[3].heightAnchor.constraint(equalToConstant: 255)
        ])
    }
}
