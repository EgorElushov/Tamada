import UIKit

final class PartyOrgController: UIViewController {
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private var dataSource = [Party]()
    private var stackView = UIStackView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.dismissViewController()
    }
    
    private func setupView() {
        setupTableView()
    }
    
    private func setupTableView() {
        let addNewPartyButton = UIButton()
        addNewPartyButton.setTitle("Перейти к созданию вечеринки", for: .normal)
        addNewPartyButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        addNewPartyButton.setTitleColor(UIColor(red: 239/255, green: 36/255, blue: 133/255, alpha: 1), for: .normal)
        addNewPartyButton.layer.cornerRadius = 12
        addNewPartyButton.backgroundColor = .lightGray
        addNewPartyButton.setHeight(50)
        view.addSubview(addNewPartyButton)
        addNewPartyButton.pin(to: view, [.left: 10, .top: 70, .right: 10])
        addNewPartyButton.addTarget(self, action: #selector(addNewPartyButtonPressed), for: .touchUpInside)
        tableView.register(PartyCell.self, forCellReuseIdentifier: PartyCell.reuseIdentifier)
        tableView.register(AddPartyCell.self, forCellReuseIdentifier: AddPartyCell.reuseIdentifier)
        //view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.keyboardDismissMode = .onDrag
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.pin(to: view, [.left: 10, .top: 250, .right: 10, .bottom: 30])
    }
    
    private func handleDelete(indexPath: IndexPath) {
        dataSource.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    @objc
    private func addNewPartyButtonPressed() {
        let newPartyController = EditPartyController()
        navigationController?.pushViewController(newPartyController, animated: true)
    }
    
    
    @objc
    private func dismissViewController() {
        self.dismiss(animated: true)
    }
}

extension PartyOrgController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return dataSource.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let addPartyCell = tableView.dequeueReusableCell(withIdentifier: AddPartyCell.reuseIdentifier, for: indexPath) as? AddPartyCell {
                addPartyCell.delegate = self
                return addPartyCell
            }
            //break;
        default:
            let party = dataSource[indexPath.row]
            if let partyCell = tableView.dequeueReusableCell(withIdentifier: PartyCell.reuseIdentifier, for: indexPath) as? PartyCell {
                partyCell.configure(party)
                return partyCell
            }
        }
        return UITableViewCell()
    }
}

extension PartyOrgController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt
                   indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(
            style: .destructive,
            title: .none
        ) { [weak self] (action, view, completion) in
            self?.handleDelete(indexPath: indexPath)
            completion(true)
        }
        deleteAction.image = UIImage(
            systemName: "trash.fill",
            withConfiguration: UIImage.SymbolConfiguration(weight: .bold)
        )?.withTintColor(.white)
        deleteAction.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

extension PartyOrgController: AddPartyDelegate {
    func newPartyAdded() {
        let defaController = defaultController()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(defaController)
        tableView.reloadData()
    }
}
