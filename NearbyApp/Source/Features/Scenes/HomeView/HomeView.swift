//
//  HomeView.swift
//  NearbyApp
//
//  Created by Edson Brandon on 10/12/24.
//

import Foundation
import UIKit
import MapKit

class HomeView: UIView {
    let mapView             = MKMapView()
    let filterScrollView    = UIScrollView()
    let containerView       = UIView()
    let dragIndicatorView   = UIView()
    let descriptionLabel    = UILabel()
    let filterStackView     = UIStackView()
    let placesTableView     = UITableView()
    
    private var containerTopConstraints: NSLayoutConstraint!
    
    private var filterButtonAction: ((Category) -> Void)?
    private var categories: [Category] = []
    private var selectedButton: UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureMapView()
        configureContainerView()
        configureFilterScrollView()
        configureDragIndicatorView()
        configureDescriptionLabel()
        configureFilterStackView()
        configurePlacesTableView()
        configureConstraints()
        setupPanGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureFilterScrollView() {
        self.addSubview(filterScrollView)
        filterScrollView.isUserInteractionEnabled                   = true
        filterScrollView.showsHorizontalScrollIndicator             = false
        filterScrollView.translatesAutoresizingMaskIntoConstraints  = false
    }
    
    private func configureMapView() {
        self.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureContainerView() {
        self.addSubview(containerView)
        containerView.layer.cornerRadius                        = 16
        containerView.backgroundColor                           = Colors.gray100
        containerView.clipsToBounds                             = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureDragIndicatorView() {
        containerView.addSubview(dragIndicatorView)
        dragIndicatorView.layer.cornerRadius                        = 3
        dragIndicatorView.clipsToBounds                             = true
        dragIndicatorView.backgroundColor                           = Colors.gray300
        dragIndicatorView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureDescriptionLabel() {
        containerView.addSubview(descriptionLabel)
        descriptionLabel.font                                       = Typography.textMD
        descriptionLabel.textColor                                  = Colors.gray600
        descriptionLabel.text                                       = "Explore locais perto de você"
        descriptionLabel.translatesAutoresizingMaskIntoConstraints  = false
    }
    
    private func configureFilterStackView() {
        filterScrollView.addSubview(filterStackView)
        filterStackView.spacing                                     = 9
        filterStackView.isUserInteractionEnabled                    = true
        filterStackView.distribution                                = .fill
        filterStackView.axis                                        = .horizontal
        filterStackView.translatesAutoresizingMaskIntoConstraints   = false
    }
    
    private func configurePlacesTableView() {
        containerView.addSubview(placesTableView)
        placesTableView.register(PlaceTableViewCell.self, forCellReuseIdentifier: PlaceTableViewCell.identifier)
        placesTableView.translatesAutoresizingMaskIntoConstraints   = false
    }
    
    func configureTableViewDelegate(_ delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        placesTableView.delegate = delegate
        placesTableView.dataSource = dataSource
    }
    
    private func createFilterButton(title: String, iconName: String) -> UIButton {
        let button = UIButton(type: .system)

        button.setImage(UIImage(systemName: iconName), for: .normal)
        button.setTitleColor(Colors.gray600, for: .normal)
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius                                               = 8
        button.tintColor                                                        = Colors.gray600
        button.backgroundColor                                                  = Colors.gray100
        button.titleLabel?.font                                                 = Typography.textSM
        button.imageView?.contentMode                                           = .scaleAspectFit
        
        button.imageEdgeInsets                                                  = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 8)
        button.titleEdgeInsets                                                  = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        button.heightAnchor.constraint(equalToConstant: 36).isActive            = true

        button.imageView?.heightAnchor.constraint(equalToConstant: 13).isActive = true
        button.imageView?.widthAnchor.constraint(equalToConstant: 13).isActive  = true
        button.translatesAutoresizingMaskIntoConstraints                        = false
        return button
    }
    
    private func updateButtonSelection(button: UIButton) {
        if let previousButton = selectedButton {
            previousButton.setTitleColor(Colors.gray600, for: .normal)
            previousButton.backgroundColor          = Colors.gray100
            previousButton.tintColor                = Colors.gray600
        }
        
        button.setTitleColor(Colors.gray100, for: .normal)
        button.backgroundColor          = Colors.greenBase
        button.tintColor                = Colors.gray100
        
        selectedButton = button
    }
    
    
    private func setupPanGesture() {
        let pantGesture         = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        containerView.addGestureRecognizer(pantGesture)
    }
    
    @objc func filterButtonTapped(_ sender: UIButton) {
        let selectedCategory = categories[sender.tag]
        updateButtonSelection(button: sender)
        filterButtonAction?(selectedCategory)
    }
    
    func updateFilterButton(with categories: [Category], action: @escaping (Category) -> Void) {
        let categoryIcons: [String: String] = [
            "Alimentação"       : "fork.knife",
            "Compras"           : "cart",
            "Hospedagem"        : "bed.double",
            "Padaria"           : "cup.and.saucer",
            "Cinema"            : "tv.fill"
        ]
        
        self.categories         = categories
        self.filterButtonAction = action
        
        for (index, category) in categories.enumerated() {
            let iconName = categoryIcons[category.name] ?? "questionmark.circle"
            let button = createFilterButton(title: category.name, iconName: iconName)
            button.tag = index
            button.addTarget(self, action: #selector(filterButtonTapped(_:)), for: .touchUpInside)
            filterStackView.addArrangedSubview(button)
            
            if category.name == "Alimentação" {
                updateButtonSelection(button: button)
            }
        }
        
    }
    
    func reloadTableViewData() {
        DispatchQueue.main.async {
            self.placesTableView.reloadData()
        }
    }

    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        let velocity = gesture.velocity(in: self)
        
        switch gesture.state {
        case .changed:
            let newtConstant = containerTopConstraints.constant + translation.y
            if newtConstant <= 0 && newtConstant >= frame.height * 0.5 {
                containerTopConstraints.constant = newtConstant
                gesture.setTranslation(.zero, in: self)
            }
            
        case .ended:
            let halfScreenHeight = -frame.height * 0.25
            var finalPositon: CGFloat
            
            if velocity.y > 0 {
                finalPositon = 0
            } else {
                finalPositon = halfScreenHeight
            }
            
            UIView.animate(withDuration: 0.3, animations: {
                self.containerTopConstraints.constant = finalPositon
                self.layoutIfNeeded()
            })
        default : break
        }
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            filterScrollView.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            filterScrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            filterScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            filterScrollView.heightAnchor.constraint(equalTo: filterStackView.heightAnchor),
            
            mapView.topAnchor.constraint(equalTo: self.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mapView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.65),
            
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            filterStackView.topAnchor.constraint(equalTo: filterScrollView.topAnchor),
            filterStackView.leadingAnchor.constraint(equalTo: filterScrollView.leadingAnchor),
            filterStackView.bottomAnchor.constraint(equalTo: filterScrollView.bottomAnchor),
            filterStackView.heightAnchor.constraint(equalToConstant: 40 ),
            filterStackView.trailingAnchor.constraint(equalTo: filterScrollView.trailingAnchor),

        ])
        
        containerTopConstraints = containerView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -16)
        containerTopConstraints.isActive = true
        
        NSLayoutConstraint.activate([
            dragIndicatorView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            dragIndicatorView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            dragIndicatorView.widthAnchor.constraint(equalToConstant: 80),
            dragIndicatorView.heightAnchor.constraint(equalToConstant: 4),
            
            descriptionLabel.topAnchor.constraint(equalTo: dragIndicatorView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            
            placesTableView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant:  16),
            placesTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            placesTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            placesTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
        
    }
}
