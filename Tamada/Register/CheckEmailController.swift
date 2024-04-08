import UIKit

final class CheckEmailController: UIViewController {
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
        commentLabel.text = "Проверьте почтовый ящик, на него пришел пароль"

        let stackView = UIStackView(arrangedSubviews: [commentLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        view.addSubview(stackView)
        stackView.pin(to: view, [.left: 25, .top: 250, .right: 25])
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
