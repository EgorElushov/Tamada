import UIKit

final class MainScreenController: UIViewController {
    private var tableOrganisatorView = UITableView(frame: .zero, style: .insetGrouped)
    private var tableGuestView = UITableView(frame: .zero, style: .plain)
    private var dataSource = [Party]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.dismissViewController()
    }
    
    private func setupView() {
        let welcomeLabel = UILabel()
        welcomeLabel.font = .systemFont(ofSize: 20.0, weight: .bold)
        welcomeLabel.textColor = .black
        welcomeLabel.numberOfLines = 2
        welcomeLabel.textAlignment = .center
        welcomeLabel.text = "Привет, {имя}"
        
        let commentLabel = UILabel()
        commentLabel.font = .systemFont(ofSize: 14.0, weight: .regular)
        commentLabel.textColor = .systemGray
        commentLabel.numberOfLines = 2
        commentLabel.textAlignment = .center
        commentLabel.text = "Чтобы продолжить, выбери\n или добавь вечеринку"
        
        let organisatorButton = UIButton()
        organisatorButton.setTitle("Перейти к созданию вечеринок", for: .normal)
        organisatorButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        organisatorButton.setTitleColor(UIColor(red: 239/255, green: 36/255, blue: 133/255, alpha: 1), for: .normal)
        organisatorButton.layer.cornerRadius = 12
        organisatorButton.backgroundColor = .lightGray
        organisatorButton.setHeight(100)
        organisatorButton.addTarget(self, action: #selector(organisatorButtonPressed), for: .touchUpInside)
        let guestButton = UIButton()
        guestButton.setTitle("Перейти к списку вечеринок в которых вы гость", for: .normal)
        guestButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        guestButton.setTitleColor(UIColor(red: 239/255, green: 36/255, blue: 133/255, alpha: 1), for: .normal)
        guestButton.layer.cornerRadius = 12
        guestButton.backgroundColor = .lightGray
        guestButton.setHeight(100)
        
        let stackView = UIStackView(arrangedSubviews: [welcomeLabel, commentLabel, organisatorButton, guestButton])
        stackView.axis = .vertical
        stackView.spacing = 25
        stackView.distribution = .fill
        view.addSubview(stackView)
        stackView.pin(to: view, [.left: 25, .top: 175, .right: 25])
    }
    
    @objc
    private func organisatorButtonPressed() {
        let orgPartyController = PartyOrgController()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(orgPartyController)
    }

    @objc
    private func dismissViewController() {
        self.dismiss(animated: true)
    }
}
