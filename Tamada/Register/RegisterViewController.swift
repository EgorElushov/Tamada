import UIKit

final class RegisterViewController: UIViewController {
    private let email = EmailAndPasswordTextField()
    private let registerButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLogoImage()
        setupView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.dismissViewController()
    }
    
    private func setupView() {
        let commentLabel = UILabel()
        commentLabel.font = .systemFont(ofSize: 14.0, weight: .regular)
        commentLabel.textColor = .systemGray
        commentLabel.numberOfLines = 0
        commentLabel.textAlignment = .left
        commentLabel.text = "Введите email"

        email.backgroundColor = UIColor(red: 254/255, green: 219/255, blue: 236/255, alpha: 1)
        email.layer.cornerRadius = 12
        email.font = .systemFont(ofSize: 14, weight: .regular)
        email.textColor = .tertiaryLabel
        email.setHeight(40)
        email.placeholder = "email"
        
        registerButton.setTitle("Отправить письмо", for: .normal)
        registerButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.cornerRadius = 12
        registerButton.backgroundColor = UIColor(red: 239/255, green: 36/255, blue: 133/255, alpha: 1)
        self.view.addSubview(registerButton)
        registerButton.setHeight(40)
        registerButton.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [commentLabel, email, registerButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        view.addSubview(stackView)
        stackView.pin(to: view, [.left: 25, .top: 250, .right: 25])
    }
    
    
    @objc
    private func registerButtonPressed() {
        // TODO: логика апишки добавить
        let mainScreen = CheckEmailController()
        navigationController?.pushViewController(mainScreen, animated: true)
    }
    
    private func setupLogoImage() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named:"Logotip")
        view.addSubview(imageView)
        imageView.pinTop(to: self.view.safeAreaLayoutGuide.topAnchor, 30)
        imageView.pinCenterX(to: self.view.centerXAnchor)
    }

    @objc
    private func dismissViewController() {
        self.dismiss(animated: true)
    }
}
