//
//  RectangleView.swift
//  Tic-Tac-Toe
//
//  Created by Ildar Garifullin on 02/10/2024.
//

import UIKit

class RectangleView: UIView {
    var textForMainLabel: String
    
    lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Some text"
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init(frame: CGRect, textForMainLabel: String) {
        self.textForMainLabel = textForMainLabel
        super.init(frame: frame)
        
        layer.cornerRadius = 30
        translatesAutoresizingMaskIntoConstraints = false
        
        mainLabel.text = textForMainLabel
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = #colorLiteral(red: 0.8718322515, green: 0.8867664933, blue: 0.9465543628, alpha: 1)
        
        addSubview(mainLabel)
    }
}

extension RectangleView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            mainLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            mainLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            mainLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
}

