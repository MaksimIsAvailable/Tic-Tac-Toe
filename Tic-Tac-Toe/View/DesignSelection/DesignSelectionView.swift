//
//  DesignSelectionView.swift
//  Tic-Tac-Toe
//
//  Created by Ildar Garifullin on 03/10/2024.
//

import UIKit

class DesignSelectionView: UIView {
    var leftImageNamed: String
    var rightImageNamed: String
    
    lazy var leftImageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.frame.size = CGSize(width: 54, height: 53)
        imageView.image = UIImage(named: "pinkXIcon")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var rightImageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.frame.size = CGSize(width: 54, height: 53)
        imageView.image = UIImage(named: "purpleOIcon")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var horizontalStackView = UIStackView()
    
    private let designSelectionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "buttonColor")
        button.layer.cornerRadius = 20
        button.setTitle("Picked", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .semibold)
//        button.titleLabel?.font = .robotoBold20()
//        button.tintColor = .specialGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    required init(frame: CGRect, leftImageNamed: String, rightImageNamed: String ) {
        self.leftImageNamed = leftImageNamed
        self.rightImageNamed = rightImageNamed
        super.init(frame: frame)
        
        layer.cornerRadius = 30
        translatesAutoresizingMaskIntoConstraints = false
        
        leftImageView.image = UIImage(named: leftImageNamed)
        rightImageView.image = UIImage(named: rightImageNamed)
        
        horizontalStackView = UIStackView(
            arrangedSubviews: [
                leftImageView,
                rightImageView
            ],
            axis: .horizontal,
            spacing: 4,
            alignment: .top
        )
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = #colorLiteral(red: 0.9205804467, green: 0.936465919, blue: 1, alpha: 1)
        
        addSubview(horizontalStackView)
        addSubview(designSelectionButton)
    }
    
    @objc private func buttonTapped() {}
}

extension DesignSelectionView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            horizontalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            
            designSelectionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            designSelectionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            designSelectionButton.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 18),
            designSelectionButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            designSelectionButton.heightAnchor.constraint(equalToConstant: 39)
        ])
    }
}
