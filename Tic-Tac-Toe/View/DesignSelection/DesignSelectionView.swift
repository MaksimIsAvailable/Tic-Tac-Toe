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
        imageView.image = UIImage(named: "pinkXIcon")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "purpleOIcon")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var horizontalStackView = UIStackView()
    private var isButtonSelected = false
    
    private let designSelectionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "backgroundColor")
        button.layer.cornerRadius = 20
        button.setTitle("Choose", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    required init(frame: CGRect, leftImageNamed: String, rightImageNamed: String ) {
        self.leftImageNamed = leftImageNamed
        self.rightImageNamed = rightImageNamed
        super.init(frame: frame)
        
        layer.cornerRadius = 30
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 20
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
        backgroundColor = .white
        
        addSubview(horizontalStackView)
        addSubview(designSelectionButton)
    }
    
    @objc private func buttonTapped() {
        isButtonSelected.toggle()
        
            if isButtonSelected {
                designSelectionButton.setTitle("Choose", for: .normal)
                designSelectionButton.backgroundColor = K.backgroundColor
                designSelectionButton.setTitleColor(.black, for: .normal)
            } else {
                designSelectionButton.setTitle("Pick", for: .normal)
                designSelectionButton.backgroundColor = UIColor(named: "buttonColor")
                designSelectionButton.setTitleColor(.white, for: .normal)
            }
    }
}

extension DesignSelectionView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: K.Size.sideConstraint),
            horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -K.Size.sideConstraint),
            horizontalStackView.topAnchor.constraint(equalTo: topAnchor, constant: K.Size.sideConstraint),
            
            designSelectionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: K.Size.sideConstraint),
            designSelectionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -K.Size.sideConstraint),
            designSelectionButton.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: K.Size.sideConstraint),
            designSelectionButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -K.Size.sideConstraint),
            designSelectionButton.heightAnchor.constraint(equalToConstant: 39)
        ])
    }
}
