import UIKit
final class PartyCell: UITableViewCell {
    static let reuseIdentifier = "PartyCell"
    
    private var textlabel = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupView()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupView() {
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(textlabel)
        textlabel.pin(to: contentView, [.left: 16, .top: 16, .right: 16, .bottom: 16])
    }
    
    public func configure(_ party: Party) {
        addSubview(textlabel)
        textlabel.translatesAutoresizingMaskIntoConstraints = false
        textlabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        textlabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 1).isActive = true
        textlabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textlabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        textlabel.setTitle(party.party, for: .normal)
        textlabel.layer.cornerRadius = 8
        let stackView = UIStackView(arrangedSubviews: [textlabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        contentView.addSubview(stackView)
        stackView.pin(to: contentView, [.left: 5, .top: 5, .right: 5, .bottom: 5])
        contentView.backgroundColor = .systemGray5
    }
}
