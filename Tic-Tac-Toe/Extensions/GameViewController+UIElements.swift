//
//  GameViewController+UIElements.swift
//  Tic-Tac-Toe
//
//  Created by Павел Широкий on 05.10.2024.
//

import UIKit

extension GameViewController {
    
    func setupMainView() -> UIView {
        let view = UIView()
        view.frame = self.view.bounds
        view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 1, alpha: 1)
        self.view.addSubview(view)
        return view
    }
    
    func setupGameView(on mainView: UIView) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        mainView.addSubview(view)
        return view
    }
    
    
}


