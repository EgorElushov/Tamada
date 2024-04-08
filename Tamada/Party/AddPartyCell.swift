import UIKit

protocol AddPartyDelegate: AnyObject {
    func newPartyAdded()
}

final class AddPartyCell: UITableViewCell, UITextViewDelegate {
    static let reuseIdentifier = "AddPartyCell"
    public var addButton = UIButton()
    public var delegate : AddPartyDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addButton.setTitle("День рождения", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        addButton.setTitleColor(.systemBackground, for: .normal)
        addButton.backgroundColor = .label
        addButton.layer.cornerRadius = 8
        addButton.setHeight(44)
        addButton.addTarget(self, action: #selector(addButtonTapped(_:)),
                            for: .touchUpInside)
        addButton.isEnabled = true
        addButton.alpha = 0.5
        let stackView = UIStackView(arrangedSubviews: [addButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        contentView.addSubview(stackView)
        stackView.pin(to: contentView, [.left: 16, .top: 16, .right: 16, .bottom: 16])
        contentView.backgroundColor = .systemGray5
    }
    
    @objc
    private func addButtonTapped(_ sender: UIButton) {
        delegate?.newPartyAdded()
        addButton.isEnabled = false
        addButton.alpha = 0.5
    }
}
