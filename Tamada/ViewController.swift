import UIKit


final class WelcomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    private let welcomeLabel = UILabel()
    private let commentLabel = UILabel()
    private let loginButton = UIButton()
    private let registerButton = UIButton()
    private let commentView = UIView()
    private let imageView = UIImageView()
    private let subimagesView = UIView()

    
    private func setupLoginButton() {
        loginButton.setTitle("Войти", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 12
        loginButton.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        loginButton.backgroundColor = UIColor(red: 239/255, green: 36/255, blue: 133/255, alpha: 1)
        self.view.addSubview(loginButton)
        loginButton.setHeight(48)
        loginButton.pinBottom(to: registerButton.topAnchor, 20)
        loginButton.pin(to: self.view, [.left: 24, .right: 24])
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
    }
    
    private func setupRegisterButton() {
        registerButton.setTitle("Зарегистрироваться", for: .normal)
        registerButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        registerButton.setTitleColor(UIColor(red: 239/255, green: 36/255, blue: 133/255, alpha: 1), for: .normal)
        registerButton.layer.cornerRadius = 12
        registerButton.backgroundColor = .clear
        self.view.addSubview(registerButton)
        registerButton.setHeight(48)
        registerButton.pinBottom(to: self.view, 40)
        registerButton.pin(to: self.view, [.left: 24, .right: 24])
        registerButton.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
    }
    
    private func setupLabelsView() {
        commentView.backgroundColor = .clear
        view.addSubview(commentView)
        commentView.pinTop(to: self.imageView.bottomAnchor)
        commentView.pin(to: self.view, [.left: 24, .right: 24])
        commentLabel.font = .systemFont(ofSize: 18.0, weight: .regular)
        commentLabel.textColor = .systemGray
        commentLabel.numberOfLines = 0
        commentLabel.textAlignment = .center
        welcomeLabel.font = .systemFont(ofSize: 20.0, weight: .bold)
        welcomeLabel.textColor = .black
        welcomeLabel.numberOfLines = 0
        welcomeLabel.textAlignment = .center
        commentView.addSubview(commentLabel)
        commentView.addSubview(welcomeLabel)
        welcomeLabel.pin(to: commentView, [.top: 16, .left: 16, .bottom: 16, .right: 16])
        commentLabel.pin(to: commentView, [.left: 16, .right: 16])
        commentLabel.pinTop(to: welcomeLabel.bottomAnchor, 16)
        welcomeLabel.text = "Привет!"
        commentLabel.text = "Мы — tamada и мы поможем \nтебе с организацией вечеринки"
    }
    
    private func setupLogoImage() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named:"Logotip")
        view.addSubview(imageView)
        imageView.pinTop(to: self.view.safeAreaLayoutGuide.topAnchor, 30)
        imageView.pinCenterX(to: self.view.centerXAnchor)
    }
    
    private func setupImage() {
        let imageTriangleView = UIImageView()
        imageTriangleView.translatesAutoresizingMaskIntoConstraints = false
        imageTriangleView.image = UIImage(named:"Triangle")
        view.addSubview(imageTriangleView)
        imageTriangleView.pinTop(to: self.commentView.bottomAnchor, 100)
        imageTriangleView.pin(to: self.view, [.left: 50])
        
        let imageRectView = UIImageView()
        imageRectView.translatesAutoresizingMaskIntoConstraints = false
        imageRectView.image = UIImage(named:"Rectangle")
        view.addSubview(imageRectView)
        imageRectView.pinTop(to: imageTriangleView.bottomAnchor)
        imageRectView.pin(to: self.view, [.left: 50])
        
        let imageArcView = UIImageView()
        imageArcView.translatesAutoresizingMaskIntoConstraints = false
        imageArcView.image = UIImage(named:"Arch")
        view.addSubview(imageArcView)
        imageArcView.pinTop(to: imageTriangleView.bottomAnchor)
        imageArcView.pinLeft(to: imageRectView, 75)
        
        let imageCircleView = UIImageView()
        imageCircleView.translatesAutoresizingMaskIntoConstraints = false
        imageCircleView.image = UIImage(named:"Circle")
        view.addSubview(imageCircleView)
        imageCircleView.pinBottom(to: imageArcView.topAnchor)
        imageCircleView.pinLeft(to: imageRectView, 75)
        
        let imageRectView1 = UIImageView()
        imageRectView1.translatesAutoresizingMaskIntoConstraints = false
        imageRectView1.image = UIImage(named:"Rectangle")
        view.addSubview(imageRectView1)
        imageRectView1.pinBottom(to: imageArcView.topAnchor)
        imageRectView1.pinLeft(to: imageCircleView, 75)
        
        let imageCircleView1 = UIImageView()
        imageCircleView1.translatesAutoresizingMaskIntoConstraints = false
        imageCircleView1.image = UIImage(named:"Circle")
        view.addSubview(imageCircleView1)
        imageCircleView1.pinBottom(to: imageArcView.topAnchor)
        imageCircleView1.pinLeft(to: imageRectView1, 75)
        
        let imageArcView1 = UIImageView()
        imageArcView1.translatesAutoresizingMaskIntoConstraints = false
        imageArcView1.image = UIImage(named:"Arch")
        view.addSubview(imageArcView1)
        imageArcView1.pinBottom(to: imageRectView1.topAnchor)
        imageArcView1.pinLeft(to: imageCircleView, 75)
        
        let imageRectView2 = UIImageView()
        imageRectView2.translatesAutoresizingMaskIntoConstraints = false
        imageRectView2.image = UIImage(named:"Rectangle")
        view.addSubview(imageRectView2)
        imageRectView2.pinBottom(to: imageRectView.bottomAnchor)
        imageRectView2.pinLeft(to: imageArcView, 150)
    }
    
    @objc
    private func loginButtonPressed() {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @objc
    private func registerButtonPressed() {
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    private func setupView() {
        setupLogoImage()
        setupRegisterButton()
        setupLoginButton()
        setupLabelsView()
        setupImage()
    }
}
