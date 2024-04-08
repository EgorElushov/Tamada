import UIKit
import MapKit

final class EditPartyController: UIViewController {
    
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
        var titleView = UITextField()
        var descriptionView = UITextField()
        titleView.font = .systemFont(ofSize: 14, weight: .regular)
        titleView.textColor = .black
        titleView.backgroundColor = .lightGray
        titleView.setHeight(100)
        titleView.layer.cornerRadius = 10
        titleView.placeholder = "Название"
        descriptionView.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionView.textColor = .black
        descriptionView.backgroundColor = .lightGray
        descriptionView.setHeight(100)
        descriptionView.layer.cornerRadius = 10
        descriptionView.placeholder = "Описание"
        
        var map = MKMapView()
        map.isZoomEnabled = true
        map.isScrollEnabled = true
        map.isPitchEnabled = true
        map.showsUserLocation = true
        
        var saveButton = UIButton()
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.backgroundColor = .systemGray
        
        let stackView = UIStackView(arrangedSubviews: [titleView, descriptionView, map, saveButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        view.addSubview(stackView)
        stackView.pin(to: view, [.left: 16, .top: 140, .right: 16, .bottom: 16])
        
    }
    
    @objc
    private func saveButtonPressed() {
        navigationController?.popViewController(animated: true)
    }

    @objc
    private func dismissViewController() {
        self.dismiss(animated: true)
    }
}

