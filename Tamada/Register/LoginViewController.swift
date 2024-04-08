import UIKit

final class LoginViewController: UIViewController {
    private let email = EmailAndPasswordTextField()
    private let password = EmailAndPasswordTextField()
    private let loginButton = UIButton()
    
    
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
        email.placeholder = "email"
        email.setHeight(40)
        
        let passwordLabel = UILabel()
        passwordLabel.font = .systemFont(ofSize: 14.0, weight: .regular)
        passwordLabel.textColor = .systemGray
        passwordLabel.numberOfLines = 0
        passwordLabel.textAlignment = .left
        passwordLabel.text = "Введите пароль"

        password.backgroundColor = UIColor(red: 254/255, green: 219/255, blue: 236/255, alpha: 1)
        password.layer.cornerRadius = 12
        password.font = .systemFont(ofSize: 14, weight: .regular)
        password.textColor = .tertiaryLabel
        password.placeholder = "Пароль"
        password.setHeight(40)
        password.isSecureTextEntry = true
        
        loginButton.setTitle("Войти", for: .normal)
        loginButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 12
        loginButton.backgroundColor = UIColor(red: 239/255, green: 36/255, blue: 133/255, alpha: 1)
        self.view.addSubview(loginButton)
        loginButton.setHeight(40)
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [commentLabel, email, passwordLabel, password, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        view.addSubview(stackView)
        stackView.pin(to: view, [.left: 25, .top: 250, .right: 25])
    }
    
    
    @objc
    private func loginButtonPressed() {
        // TODO: логика апишки добавить
        let mainScreen = MainScreenController()
        mainScreen.modalPresentationStyle = .fullScreen
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainScreen)
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
