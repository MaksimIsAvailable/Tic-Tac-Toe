
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
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        label.sizeToFit()
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
    
    let buttonPlayAgain: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 132/255, green: 128/255, blue: 212/255, alpha: 1)
        
        button.setTitle("Play again", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonBack: UIButton = {
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
    
//MARK: - ImageToResult
    
    var imagesForResults: [UIImage] = []
    
    func addImageResults () {
    if let draw = UIImage(named: "drawIcon"),
       let lose = UIImage(named: "loseIcon"),
       let win = UIImage(named: "winIcon") {
        imagesForResults = [draw, lose, win] }
    else {print("Одно или несколько изображений не найдены.")}
    }
//
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addImageResults()
    }
    
  
    
    // MARK: - UI Setup
    private func setupUI() {
        
//        let stackView = UIStackView(arrangedSubviews: [titleLabel, imageView])
//        stackView.axis = .vertical
//        stackView.spacing = 20
//
//
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        view.addSubview(stackView)
        
        
        view.addSubview(backgroundViewColor)
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(buttonPlayAgain)
        view.addSubview(buttonBack)
        
        // Constraints
        NSLayoutConstraint.activate([
            backgroundViewColor.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundViewColor.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundViewColor.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundViewColor.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 160),
            titleLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 74),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -73),
            
            
            buttonPlayAgain.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 160),
            buttonPlayAgain.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21),
            buttonPlayAgain.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -21),
            buttonPlayAgain.heightAnchor.constraint(equalToConstant: 72),
            
            
            buttonBack.topAnchor.constraint(equalTo: buttonPlayAgain.bottomAnchor, constant: 13),
            buttonBack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21),
            buttonBack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -21),
            buttonBack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -18),
            buttonBack.heightAnchor.constraint(equalToConstant: 72) ])
        
    }
    // MARK: - Button Action
    @objc private func buttonTapped() {
        print("Кнопка нажата!")
    }
}


