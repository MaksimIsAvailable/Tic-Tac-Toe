
import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Elements
    let backgroundViewColor: UIView = {
        let background = UIView()
        background.backgroundColor = UIColor(red: 245/255, green: 247/255, blue: 255/255, alpha: 1)
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "You Lose!"
        label.font = UIFont.boldSystemFont(ofSize: 44)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "loseIcon")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let actionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 132/255, green: 128/255, blue: 212/255, alpha: 1)
        
        button.setTitle("Play again", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let actionButtonSecond: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        
        button.layer.borderColor = UIColor(red: 132/255, green: 128/255, blue: 212/255, alpha: 1).cgColor
        button.layer.borderWidth = 2.0
        button.layer.cornerRadius = 30
        
        button.setTitle("Back", for: .normal)
        button.setTitleColor(UIColor(red: 132/255, green: 128/255, blue: 212/255, alpha: 1), for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.addSubview(backgroundViewColor)
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(actionButton)
        view.addSubview(actionButtonSecond)
        
        // Constraints
        NSLayoutConstraint.activate([
            backgroundViewColor.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundViewColor.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundViewColor.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundViewColor.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 204),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 81),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 228),
            imageView.heightAnchor.constraint(equalToConstant: 272)
        ])
        
        NSLayoutConstraint.activate([
            actionButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 636),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            actionButton.widthAnchor.constraint(equalToConstant: 348),
            actionButton.heightAnchor.constraint(equalToConstant: 72)
        ])
        
        NSLayoutConstraint.activate([
            actionButtonSecond.topAnchor.constraint(equalTo: actionButton.bottomAnchor, constant: 20),
            actionButtonSecond.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            actionButtonSecond.widthAnchor.constraint(equalToConstant: 348),
            actionButtonSecond.heightAnchor.constraint(equalToConstant: 72)
        ])
    }
    // MARK: - Button Action
    @objc private func buttonTapped() {
        print("Кнопка нажата!")
    }
}

