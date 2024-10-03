//
//  RoundView.swift
//  Tic-Tac-Toe
//
//  Created by Ildar Garifullin on 02/10/2024.
//

import UIKit

class RoundView: UIView {
    var numberOfPosition: Int
    
    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "Some text"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init(frame: CGRect, numberOfPosition: Int) {
        self.numberOfPosition = numberOfPosition
        super.init(frame: frame)
        
        layer.cornerRadius = 22.5
        translatesAutoresizingMaskIntoConstraints = false
        
        numberLabel.text = String(numberOfPosition)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = #colorLiteral(red: 0.8375778794, green: 0.7538908124, blue: 0.96424371, alpha: 1)
        
        addSubview(numberLabel)
    }
}

extension RoundView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            numberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            numberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            numberLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            numberLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
}
