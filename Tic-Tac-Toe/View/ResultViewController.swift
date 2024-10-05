
import UIKit

enum TypeResult {
    case win
    case lose
    case draw
}

class ResultViewController: UIViewController {
    
    // MARK: - UI Elements
    private var result: TypeResult = .win
 
    private var screenHeight: CGFloat = 0
    private var screenWidth: CGFloat = 0
    private var deviceOrientation = UIDevice.current.orientation
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Player One Win!"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        label.sizeToFit()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "winIcon")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: getImageHeight()).isActive = true
        return imageView
    }()
    
    private lazy var buttonPlayAgain: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 132/255, green: 128/255, blue: 212/255, alpha: 1)
        
        button.setTitle("Play again", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.cornerRadius = getButtonCornerRadius()
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private lazy var buttonBack: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        
        button.layer.borderColor = UIColor(red: 132/255, green: 128/255, blue: 212/255, alpha: 1).cgColor
        button.layer.borderWidth = 2.0
        button.layer.cornerRadius = getButtonCornerRadius()
        
        button.setTitle("Back", for: .normal)
        button.setTitleColor(UIColor(red: 132/255, green: 128/255, blue: 212/255, alpha: 1), for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [buttonPlayAgain, buttonBack])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .fill
//        stack.backgroundColor = .red
        stack.spacing = 13
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var labelAndImageStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, imageView])
        stack.axis = .vertical
        stack.distribution = .equalCentering
        stack.alignment = .fill
//        stack.backgroundColor = .red
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Lifecycle Methods
    
   convenience init(result: TypeResult) {
       self.init()
       self.result = result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getScreenSize()
        setupUI()
        setResult()
    }
    
    override func willTransition(
        to newCollection: UITraitCollection,
        with coordinator: any UIViewControllerTransitionCoordinator
    ) {
        deviceOrientation = UIDevice.current.orientation
        updateButtons()
        imageView.heightAnchor.constraint(equalToConstant: getImageHeight()).isActive = true

    }
    
    override func viewDidLayoutSubviews() {
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func getButtonStackHeight() -> CGFloat {
        switch deviceOrientation {
        case .landscapeLeft, .landscapeRight:
            return screenWidth * 157 / 844
        default:
            return screenHeight * 157 / 844
        }
    }
    
    private func getButtonCornerRadius() -> CGFloat {
        switch deviceOrientation {
        case .landscapeLeft, .landscapeRight:
            return screenWidth * 30 / 844
        default:
            return screenHeight * 30 / 844
        }
    }
    
    private func getImageHeight() -> CGFloat {
        switch deviceOrientation {
        case .landscapeLeft, .landscapeRight:
            return screenWidth * 228 / 844
        default:
            return screenHeight * 228 / 844
        }
    }
    
    private func getScreenSize() {
        screenHeight = UIScreen.main.bounds.height
        screenWidth = UIScreen.main.bounds.width

    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(red: 245/255, green: 247/255, blue: 255/255, alpha: 1)
    
        view.addSubview(labelAndImageStackView)
        view.addSubview(buttonStackView)
        
        // Constraints
        NSLayoutConstraint.activate([
       
            labelAndImageStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21),
            labelAndImageStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -21),
            labelAndImageStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: screenHeight * 160 / 844),
           
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -21),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -18),
            buttonStackView.heightAnchor.constraint(equalToConstant: getButtonStackHeight())
        ])
    }
    
    private func setResult() {
        switch result {
        case .win:
            titleLabel.text = "Player One win!"
            imageView.image = UIImage(named: "winIcon")
        case .lose:
            titleLabel.text = "You Lose!"
            imageView.image = UIImage(named: "loseIcon")
        case .draw:
            titleLabel.text = "Draw!"
            imageView.image = UIImage(named: "drawIcon")
        }
    }
    
    private func updateButtons() {
        NSLayoutConstraint.activate([
            buttonStackView.heightAnchor.constraint(equalToConstant: getButtonStackHeight())
        ])
        buttonPlayAgain.layer.cornerRadius = getButtonCornerRadius()
        buttonBack.layer.cornerRadius = getButtonCornerRadius()
    }
    
    // MARK: - Button Action
    @objc private func buttonTapped() {
        print("Кнопка нажата!")
    }
}

